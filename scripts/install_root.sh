#!/system/bin/sh
# QcloudVolte dual-SIM VoLTE - install WITHOUT a module (root required)
# Replaces the stock Ims6.apk and libims.lge.so with the patched ones. Backs the stock files up first.
# Author: Abdul Qadeer (@Qcloudfx). Credits: Great Luke (@greatluke12), @Kiyomiyuki17.
#
# Put Ims6.apk and libims.lge.so next to this script (or run it from inside the module folder), then:
#   su -c "sh /path/to/install_root.sh"

D=${0%/*}; [ "$D" = "$0" ] && D=.; D=$(cd "$D" && pwd)
APK_DST=${QV_APK_DST:-/system_ext/priv-app/Ims6/Ims6.apk}
LIB_DST=${QV_LIB_DST:-/system_ext/lib64/libims.lge.so}
BK=${QV_BACKUP:-/sdcard/QcloudVolte_backup}
MOD=/data/adb/modules/qcloudvolte_dualsim

say() { echo "[QcloudVolte] $*"; }
die() { say "ERROR: $*"; exit 1; }

[ "$QV_TEST" = 1 ] || [ "$(id -u)" = 0 ] || die "run as root: su -c \"sh $0\""

APK_SRC=; LIB_SRC=
for p in "$D/Ims6.apk" "$D/../system/system_ext/priv-app/Ims6/Ims6.apk"; do [ -s "$p" ] && { APK_SRC=$p; break; }; done
for p in "$D/libims.lge.so" "$D/../system/system_ext/lib64/libims.lge.so"; do [ -s "$p" ] && { LIB_SRC=$p; break; }; done
[ -n "$APK_SRC" ] || die "Ims6.apk not found next to the script"
[ -n "$LIB_SRC" ] || die "libims.lge.so not found next to the script"

if [ -d "$MOD" ] && [ ! -f "$MOD/disable" ] && [ ! -f "$MOD/remove" ] && [ "$QV_FORCE" != 1 ]; then
  die "the QcloudVolte module is active. Disable or remove it first (or run with QV_FORCE=1)."
fi

# make the partition writable (errors ignored, the write test below decides)
for m in /system_ext /system/system_ext /system /; do mount -o remount,rw "$m" 2>/dev/null; done
for f in "$APK_DST" "$LIB_DST"; do
  t="$(dirname "$f")/.qv_write_test"
  touch "$t" 2>/dev/null || die "$(dirname "$f") is read-only on this ROM. Use the Magisk/KernelSU module instead."
  rm -f "$t"
done

# backup stock files (only once)
mkdir -p "$BK" || die "cannot create $BK"
[ -f "$BK/Ims6.apk.orig" ]       || cp -a "$APK_DST" "$BK/Ims6.apk.orig" || die "backup failed"
[ -f "$BK/libims.lge.so.orig" ]  || cp -a "$LIB_DST" "$BK/libims.lge.so.orig" || die "backup failed"
say "stock files backed up in $BK"

put() { # src dst mode label
  cp "$1" "$2.qvnew" || return 1
  chmod "$3" "$2.qvnew"; chown 0:0 "$2.qvnew" 2>/dev/null; chcon "$4" "$2.qvnew" 2>/dev/null
  mv -f "$2.qvnew" "$2" || return 1
  [ "$(md5sum "$1" | cut -d' ' -f1)" = "$(md5sum "$2" | cut -d' ' -f1)" ]
}
put "$APK_SRC" "$APK_DST" 644 u:object_r:system_file:s0     || die "could not replace Ims6.apk"
put "$LIB_SRC" "$LIB_DST" 644 u:object_r:system_lib_file:s0 || die "could not replace libims.lge.so"
sync
say "Ims6.apk      -> $APK_DST  OK"
say "libims.lge.so -> $LIB_DST  OK"
say "DONE. Reboot, wait 3-4 minutes, toggle airplane mode once."
say "To go back to stock: sh restore_root.sh"
