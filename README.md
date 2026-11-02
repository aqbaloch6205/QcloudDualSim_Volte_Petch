# Dual-SIM VoLTE on LG V60 ThinQ (LM-V600VM) custom ROMs

**Author: Abdul Qadeer ([@Qcloudfx](https://github.com/Qcloudfx))**
Reverse engineering, patches and testing took more than 4 days of work. If you use, fork, port or redistribute this work,
please keep this credit and link back to the original repository.

Thanks to:
- **Great Luke ([@greatluke12](https://github.com/greatluke12))** for the base VoLTE port (single SIM), which this work builds on.
- **[@Kiyomiyuki17](https://github.com/Kiyomiyuki17)** for the ROM base, Infinity X 4.1 (Android 17).

Patches that make **VoLTE register on both SIM slots** on an LG V60 ThinQ running a custom Android ROM
(tested on Infinity X, Android 17, rooted with KernelSU), using LG's stock IMS stack.

Tested with Jazz (SIM 1, `mcc410 mnc001`) and Ufone (SIM 2, `mcc410 mnc003`) in Pakistan.
Both SIMs show `IMS Registration: Registered` and `Voice over LTE: Available`, and the status bar shows `VoLTE 1 | 2`.

> Status: works for the author. Not a general-purpose release. Read "Limitations" before using it.

## Why it was broken

On stock LG firmware dual VoLTE works. On the custom ROM only the default-data SIM registered. The modem and the carriers
were fine: the Android side showed an `ims` data network with P-CSCF addresses on both slots. The cause was in the ROM's copy of LG's IMS software
(`com.lge.ims`, `Ims6.apk`, plus the native `libims.lge.so`). There were five separate problems, and **all five** have to be fixed.

| # | Symptom | Root cause | Fix |
|---|---------|-----------|-----|
| 1 | Only the default-data slot is "active"; the other slot never gets an IMS PDN | Multi-IMS gate `MSimUtils.isMultiImsEnabled()` (about 50 call sites) and `isMultiLteEnabled()` read vendor properties through `ImsProperties$Vendor.getSysProp(...)`, which is stubbed in this build and always returns the default (off). The real properties are `persist.vendor.lge.ims.dualvolte` and `persist.vendor.lge.data.ltedsds`, and they are not set on the ROM | Make both methods return `true` (smali) |
| 2 | `SIMOperatorDetector` only calls `setActive` for the default-data slot | Same gate in `SIMOperatorDetector.isMultiImsEnabled()` | Return `true` (smali) |
| 3 | The non-default slot's SIM stays `READY/UNKNOWN` inside LGIMS, so no VoLTE toggle and no registration | `LGExtApi$Uicc.getSimState(slot)` maps Android's `SIM_STATE_READY (5)` to the string `"READY"`, but LGIMS waits for `"LOADED"` (Android 17 reports READY for a fully loaded SIM) | Change the returned string to `"LOADED"` (smali) |
| 4 | Slot 1 gets its IMS PDN, then the log says `services over cellular is not available`, `aos=not-ready`, and no SIP `REGISTER` is ever sent | Native check `AoSServiceAvailableCellular::CheckServiceAvailable` ends with an unavailable-reason list that is non-empty for the non-DDS slot. The reasons are masked in the log (`(*)`), so the exact failing check was not identified. It is bypassed instead | Force the function's result to "available" (native, 4 bytes) |
| 5 | Slot 1 gets `200 OK` to `REGISTER` but Android still shows `Not Registered` / `Voice over LTE: Unavailable` | LGIMS publishes registration state through a content provider (`content://com.lge.ims.provider.ims_state/...`, `ims_state.db`) with **one row per phone**. The row count is `isMultiSimEnabled() ? 2 : 1`, evaluated when the database is first created (early, before TelephonyManager is ready), so only 1 row existed. Updates for phone 1 matched no row and were dropped | Make `ImsState.getTableContentCount()` return `2`, then delete the old `ims_state.db` so it is recreated with two rows (smali + one-time DB reset) |

## What is patched

### Java / smali (`Ims6.apk`, `/system_ext/priv-app/Ims6/Ims6.apk`)

All edits are small and local.

| File | Method | Change |
|------|--------|--------|
| `smali/com/lge/ims/common/util/MSimUtils.smali` (now calls `QcloudVolte`) | `isMultiImsEnabled()Z`, `isMultiLteEnabled()Z` | `.locals 1` / `const/4 v0, 0x1` / `return v0` |
| `com/lge/ims/app/SIMOperatorDetector.smali` | `isMultiImsEnabled()Z` | `.registers 2` / `const/4 v0, 0x1` / `return v0` |
| `com/lge/ims/common/util/LGExtApi$Uicc.smali` | `getSimState(I)`, `:pswitch_4` | `const-string v1, "READY"` becomes `"LOADED"` |
| `com/lge/ims/volte/provider/external/ImsState.smali` | `getTableContentCount()I` | `.locals 1` / `const/4 v0, 0x2` / `return v0` |
| `smali/com/lge/ims/common/agents/dcm/DCApn.smali` | `getPcscfAddress(I)` | take the P-CSCF from `LinkProperties` (`const/4 v1, 0x0` path). Needed on this ROM so the P-CSCF address is found |

Decompile with `apktool d` (2.9.3 was used), edit the smali, rebuild and re-sign the apk.
The edited smali was not machine-verified by a full re-assembly in the author's workflow; it was tested on the device.

### Native (`libims.lge.so`, `/system_ext/lib64/libims.lge.so`, aarch64)

The library is a stripped ELF with dynamic symbols. The R-E segment maps 1:1, so **file offset = virtual address**.
Reference build: size `18233112` bytes, md5 `2b4ce6ca5a045f949fd1569266da3d91`.

| Offset | Function | Original | Patched | Meaning |
|--------|----------|----------|---------|---------|
| `0x6d5754` (8 bytes, right after the function's `bti c` at `0x6d5750`) | `IsMultiImsEnabled()` | `88 52 00 b0` `08 15 47 f9` (`adrp x8,...` / `ldr x8,[x8,...]`) | `20 00 80 52` `c0 03 5f d6` | `mov w0,#1` / `ret` |
| `0xa83c68` | `AoSServiceAvailableCellular::CheckServiceAvailable()` | `f4 03 00 2a` (`mov w20, w0`) | `34 00 80 52` (`mov w20, #1`) | the value returned is the result of `IsUnavailableReasonEmpty()`; forcing it to 1 makes the function always report "available" |

Patched md5: `6cc81e7aaffafe13fcebf0a10171f20f` (12 bytes differ from the original in total).

**These offsets are valid for that exact build only.** For another build, locate the functions again:

```sh
nm -D --demangle libims.lge.so | grep -E "IsMultiImsEnabled|CheckServiceAvailable"
llvm-objdump -d --no-show-raw-insn libims.lge.so | less     # then find the call to IsUnavailableReasonEmpty
```

In `CheckServiceAvailable`, find `bl AoSServiceAvailable::IsUnavailableReasonEmpty`. The instruction right after it (`mov w20, w0`) is the one to replace.

## Easy install: Magisk / KernelSU module (recommended for non-technical users)

Build the zips with `python3 build.py` (put your own patched files in `release-files/` first, see that folder's README).

Flash `QcloudVolte-Module.zip` in KernelSU or Magisk, reboot, wait 3 to 4 minutes, then toggle airplane mode once.
No terminal, no file copying, and nothing in `/system_ext` is changed (systemless). Remove the module and reboot to go back to stock.

- The module carries the patched `Ims6.apk`.
- The patched `libims.lge.so` is **not** shipped. The installer copies the library from your own phone, checks that it is the supported build
  (md5 `2b4ce6ca5a045f949fd1569266da3d91`) and patches the 12 bytes listed below. If the build is different it aborts and changes nothing.
- `service.sh` re-applies the IPsec helper relabel at boot (best effort) and writes `/data/local/tmp/qcloudvolte_module.log`.
- Permissive SELinux is **off** by default. If VoLTE does not register, create `/data/adb/qcloudvolte_permissive` and reboot (see Limitations).

Module layout: `module.prop`, `META-INF/` (installer), `customize.sh` (checks files, sets permissions and labels), `system/system_ext/...` (the two patched files), `scripts/` (root and adb installers and `check.sh`).

## Manual install (replace the files in their original location)

Replace the two stock files in place. **Back up the originals first**, and keep the same owner, mode and SELinux label.

| File | Location |
|------|----------|
| patched `Ims6.apk` | `/system_ext/priv-app/Ims6/Ims6.apk` |
| patched `libims.lge.so` | `/system/system_ext/lib64/libims.lge.so` |

(`/system_ext` is the same partition as `/system/system_ext`. The Ims6 `lib/arm64` entry is a symlink to this library, so replacing the one file is enough.)

1. Make the partition writable (root shell). On a ROM with dynamic partitions and read-only/EROFS images you may need to remount rw, or use a systemless approach (see Limitations):
   ```sh
   mount -o remount,rw /system_ext 2>/dev/null || mount -o remount,rw /
   ```
2. Back up the originals:
   ```sh
   cp -a /system_ext/priv-app/Ims6/Ims6.apk      /sdcard/Ims6.apk.orig
   cp -a /system_ext/lib64/libims.lge.so         /sdcard/libims.lge.so.orig
   ```
3. Copy the patched files over the originals and fix permissions and labels:
   ```sh
   cp /sdcard/Ims6.apk        /system_ext/priv-app/Ims6/Ims6.apk
   chmod 644 /system_ext/priv-app/Ims6/Ims6.apk
   chcon u:object_r:system_file:s0 /system_ext/priv-app/Ims6/Ims6.apk

   cp /sdcard/libims.lge.so /system/system_ext/lib64/libims.lge.so
   chmod 644 /system/system_ext/lib64/libims.lge.so
   chcon u:object_r:system_lib_file:s0 /system/system_ext/lib64/libims.lge.so
   ```
4. Environment setup. The author saw SELinux denials from the IPsec helpers in the log, so this ROM needs:
   - the IPsec helper binaries (`imsipsecstarter`, `imsipsecclient`) labelled `u:object_r:vendor_ims_exec:s0` (`chcon`)
   - SELinux permissive (`setenforce 0`) while testing. A proper fix is `sepolicy` rules for the denials seen (`netlink_xfrm_socket`, `net_admin`, `nosuid_transition`, `vendor_qtelephony` socket, property access). That has not been written
5. **First time only:** delete the old IMS state database so it is recreated with two rows:
   ```sh
   am force-stop com.lge.ims
   for f in $(find /data -name 'ims_state.db*'); do rm -f "$f"; done
   am force-stop com.lge.ims
   ```
6. Reboot (or at least `am force-stop com.lge.ims`), toggle airplane mode and wait 3 to 4 minutes. In the dialer: `*#*#4636#*#*` (Phone info), for each phone index
   check `IMS Registration: Registered`, `Voice over LTE: Available`.

### Restoring

Copy the two `.orig` backups back to the same places, fix the labels as above and reboot.

## Verifying

```sh
# both phones should have a row (Row: 0 and Row: 1); service_status=3 (voice+video) once registered
content query --uri content://com.lge.ims.provider.ims_state/volte_state
# logcat: SIP traffic for both operators
logcat -d | grep -E "LGIMS +: (REGISTER|SIP/2.0)"
# expected: REGISTER ...mnc001... and REGISTER ...mnc003..., each answered 401 then 200 OK
logcat -d | grep -E "ApnImsGlobal::printCondition" | tail    # expect aos=ready on [0] and [1]
logcat -d | grep -E "SLOT\[|multi-IMS="                     # expect SLOT[0/active] and SLOT[1/active], multi-IMS=true
```

## Limitations

- Everything above was done on one device and one ROM build. Offsets, smali line numbers and class names may differ elsewhere.
- Bypassing `CheckServiceAvailable` means LGIMS will no longer refuse VoLTE on the second slot for **any** reason that check would normally apply
  (VoLTE setting off, roaming rules, CS call in progress and so on). The failing check for the non-default slot was not isolated.
  A narrower fix would find which `Check*` call rejects slot 1.
- Not tested: roaming, VoWiFi, video calling on both SIMs, calls on both SIMs at once, other carriers.
- SELinux is set to permissive in the author's setup. This is a workaround, not a fix.
- Replacing files in `/system_ext` needs a writable system partition. A ROM update or OTA will overwrite the patched files again.
- A Magisk/KernelSU module is provided in `module/` (systemless). The manual steps above are the fallback.

## Method (for anyone doing the same on another device)

1. Read the `ImsPolicy` / `SLOT[x/active]` / `multi-IMS=` log lines from `SIMOperatorDetector` to see whether each slot is active.
2. Compare the `ApnImsGlobal::printCondition` flags per slot (`rat`, `vops`, `aos`, `esm`).
3. Check the IMS data networks: `dumpsys connectivity` and `dumpsys telephony.registry` (PcscfAddresses, `ims` network per sub).
4. If `REGISTER` is never sent, trace the native AoS availability checks. If `200 OK` arrives but Android disagrees, look at how registration state reaches
   the framework (here: the `ims_state` content provider, then `ImsFeatureManager` and `MmTelFeature`).

## Debugging / reporting a problem

The patch includes a small core class, `QcloudVolte` (`com/lge/ims/common/util/QcloudVolte.smali`). Every patched class reads its fix value from it,
and it writes a few log lines so problems are easy to diagnose. It was added purely to make debugging easy.

```sh
logcat -d -s QcloudVolte
```

| Log line | Meaning |
|----------|---------|
| `LOADED: dual-SIM VoLTE fix by ...` | the patched Ims6.apk is installed and the core class was loaded (logged once) |
| `registration slot=0 state=3 (REGISTERED(VOICE+VIDEO))` | registration state of each slot, every time it changes. `0` not registered, `1` voice, `2` video, `3` voice+video |
| `integrity check FAILED: fix is disabled` | the core class was modified, so the fix turns itself off |

If something does not work:
1. Reboot, wait 3 to 4 minutes, then toggle airplane mode once.
2. Run `logcat -d -s QcloudVolte > qcloudvolte_log.txt`. If there is no `LOADED` line, the patched apk is not installed (or `QcloudVolte.smali` is in the wrong dex).
3. Send `qcloudvolte_log.txt` together with the output of `getprop ro.build.display.id` to the author on Telegram: **<add your Telegram handle here>**.

Files that must be installed together: `QcloudVolte`, `MSimUtils`, `SIMOperatorDetector`, `LGExtApi$Uicc`, `ImsState`, `ImsStateProvider`, `UCStateUtils`.
Removing `QcloudVolte` makes LGIMS crash; editing it disables the fix.

## Device tree (ROM build)

If you build the ROM yourself, you can ship the patch inside the device tree instead of flashing the module.
The files below are LG's software, so keep the device tree private if you add them.

1. Find the original module names in your tree (they can differ between trees):
   ```sh
   grep -rn "Ims6\|libims.lge" vendor/lge device/lge
   ```
2. Put the patched files in the device tree:
   ```
   device/lge/timelm/qcloudvolte/prebuilt/Ims6.apk
   device/lge/timelm/qcloudvolte/prebuilt/lib64/libims.lge.so
   ```
3. Add `device/lge/timelm/qcloudvolte/Android.mk` (Make style; check the tree first, see the note below):
   ```make
   LOCAL_PATH := $(call my-dir)

   include $(CLEAR_VARS)
   LOCAL_MODULE := Ims6
   LOCAL_MODULE_CLASS := APPS
   LOCAL_MODULE_TAGS := optional
   LOCAL_PRIVILEGED_MODULE := true
   LOCAL_CERTIFICATE := PRESIGNED
   LOCAL_SRC_FILES := prebuilt/Ims6.apk
   LOCAL_MODULE_PATH := $(TARGET_OUT_SYSTEM_EXT)/priv-app/Ims6
   LOCAL_OVERRIDES_PACKAGES := Ims6
   include $(BUILD_PREBUILT)

   include $(CLEAR_VARS)
   LOCAL_MODULE := libims.lge
   LOCAL_MODULE_CLASS := SHARED_LIBRARIES
   LOCAL_MULTILIB := 64
   LOCAL_SRC_FILES := prebuilt/lib64/libims.lge.so
   LOCAL_MODULE_PATH := $(TARGET_OUT_SYSTEM_EXT)/lib64
   LOCAL_MODULE_STEM := libims.lge
   include $(BUILD_PREBUILT)
   ```
4. Include it in the device makefiles (`timelm-vendor.mk` or `device.mk`):
   ```make
   PRODUCT_PACKAGES += Ims6 libims.lge
   ```
5. Build and check that `Ims6.apk` and `libims.lge.so` in the output match the md5 values above.

Note: this example was written without reading the device tree. Confirm the original module names (step 1) and whether the tree uses `Android.bp`
(then use `prebuilt_app` and `prebuilt_shared_library`) before building.

## Release

**Local release (includes the module zip):** on the machine that has your patched files in `release-files/`:
```
python3 release.py v1.0
```
This builds the module, the system installer and the scripts zips from `release-files/system_ext/...` and creates the GitHub release (or uploads to it if it exists). It needs the GitHub CLI (`gh auth login`).

**System installer zip (no Magisk):** unzip it, then as root run `sh install_root.sh`. It backs up the stock files and replaces them with the patched ones.

**GitHub Actions release (scripts only):**

Push a tag (`v1.0`, `v1.1`, ...) and `.github/workflows/release.yml` runs `build.py` and creates a GitHub release with the zips and `MD5SUMS.txt`.
The release text is in `RELEASE_NOTES.md`. The public release contains scripts only. The module zip is built only where `release-files/` has your own patched files,
so keep those files out of a public repository.

## Credits

Created by **Abdul Qadeer ([@Qcloudfx](https://github.com/Qcloudfx))**: investigation, smali and native patches, testing on the LG V60 ThinQ with Jazz and Ufone.
Please credit the author and link to this repository when you reuse any part of this work.

Built on top of:
- **Great Luke ([@greatluke12](https://github.com/greatluke12))**: base VoLTE port (single SIM).
- **[@Kiyomiyuki17](https://github.com/Kiyomiyuki17)**: ROM base, Infinity X 4.1 (Android 17).

Special thanks to Luke for the base VoLTE port (single SIM), the foundation this dual-SIM fix was built on.

## Disclaimer

Modifying IMS and telephony components can break calls and emergency calling. Keep backups of the original files
and know how to restore them (see "Restoring"). Use at your own risk.
This repository contains instructions and byte-level patches only; it does not include LG's firmware files.
