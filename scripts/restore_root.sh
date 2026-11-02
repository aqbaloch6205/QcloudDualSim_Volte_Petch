#!/system/bin/sh
# QcloudVolte: put the stock Ims6.apk and libims.lge.so back (needs the backup made by install_root.sh)
APK_DST=${QV_APK_DST:-/system_ext/priv-app/Ims6/Ims6.apk}
LIB_DST=${QV_LIB_DST:-/system_ext/lib64/libims.lge.so}
BK=${QV_BACKUP:-/sdcard/QcloudVolte_backup}
say() { echo "[QcloudVolte] $*"; }
die() { say "ERROR: $*"; exit 1; }
[ "$QV_TEST" = 1 ] || [ "$(id -u)" = 0 ] || die "run as root: su -c \"sh $0\""
[ -f "$BK/Ims6.apk.orig" ] && [ -f "$BK/libims.lge.so.orig" ] || die "no backup found in $BK"
for m in /system_ext /system/system_ext /system /; do mount -o remount,rw "$m" 2>/dev/null; done
put() { cp "$1" "$2.qvnew" || return 1; chmod 644 "$2.qvnew"; chown 0:0 "$2.qvnew" 2>/dev/null; chcon "$3" "$2.qvnew" 2>/dev/null; mv -f "$2.qvnew" "$2"; }
put "$BK/Ims6.apk.orig"      "$APK_DST" u:object_r:system_file:s0     || die "restore of Ims6.apk failed"
put "$BK/libims.lge.so.orig" "$LIB_DST" u:object_r:system_lib_file:s0 || die "restore of libims.lge.so failed"
sync
say "stock files restored. Reboot."
