## QcloudVolte Dual-SIM VoLTE (LG V60 ThinQ, LM-V600VM)

Dual-SIM VoLTE patch for LG V60 ThinQ custom ROMs (tested on Infinity X 4.1, Android 17). Both SIM slots register on IMS and show VoLTE.

**Credits:** Abdul Qadeer ([@Qcloudfx](https://github.com/Qcloudfx)): investigation, patches, testing. Great Luke ([@greatluke12](https://github.com/greatluke12)): base VoLTE port (single SIM). [@Kiyomiyuki17](https://github.com/Kiyomiyuki17): ROM base (Infinity X 4.1).

**In this release:** `QcloudVolte-Scripts.zip` (install, restore, check, adb installers). The module zip is built only when you add your own patched files.

**Not in this release:** LG's `Ims6.apk` and `libims.lge.so`, original or patched. Build the patched files yourself from `smali/` and `native/patch_libims.sh`.

**Requirements:** LG V60 ThinQ (LM-V600VM), custom ROM with KernelSU or Magisk, root, and a stock `libims.lge.so` with md5 `2b4ce6ca5a045f949fd1569266da3d91`.

**Install:** Run `scripts/install_root.sh` as root (or flash the module), reboot, wait 3 to 4 minutes, toggle airplane mode once. Check each SIM in Phone info: `IMS Registration: Registered`.

**Verify:** `su -c "sh check.sh"` and `logcat -d -s QcloudVolte`.

**Limits:** Tested on one device and one ROM build. Bypasses one availability check, so roaming, VoWiFi and video on both SIMs are untested. A ROM update overwrites the patched files.

**Uninstall:** remove the module and reboot, or run `scripts/restore_root.sh`.

**Disclaimer:** Modifying IMS and telephony can break calls, including emergency calls. Keep backups. Use at your own risk. LG's software remains LG's property.

**Report a problem:** send `logcat -d -s QcloudVolte` output and `getprop ro.build.display.id` to <add your handle here>.
