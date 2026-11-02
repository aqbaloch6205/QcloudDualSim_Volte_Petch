#!/system/bin/sh
# QcloudVolte: check that the module (or the replaced files) is installed and working. Run as root:
#   su -c "sh check.sh"
MOD=/data/adb/modules/qcloudvolte_dualsim
LIBMD5=6cc81e7aaffafe13fcebf0a10171f20f
ok()   { echo "PASS  $*"; }
bad()  { echo "FAIL  $*"; }
if [ -d "$MOD" ]; then
  ok "module folder exists ($(grep '^version=' $MOD/module.prop 2>/dev/null))"
  [ -f "$MOD/disable" ] && bad "module is DISABLED" || ok "module is enabled"
  [ -f "$MOD/remove" ]  && bad "module is marked for removal" || ok "module not marked for removal"
  [ -s "$MOD/system/system_ext/priv-app/Ims6/Ims6.apk" ] && ok "module contains Ims6.apk"       || bad "module has no Ims6.apk"
  [ -s "$MOD/system/system_ext/lib64/libims.lge.so" ]    && ok "module contains libims.lge.so" || bad "module has no libims.lge.so"
else
  echo "INFO  no module found (fine if you used install_root.sh)"
fi
L=$(md5sum /system_ext/lib64/libims.lge.so 2>/dev/null | cut -d' ' -f1)
[ "$L" = "$LIBMD5" ] && ok "libims.lge.so in use is the patched one" || bad "libims.lge.so in use md5=$L (expected $LIBMD5)"
A=$(md5sum /system_ext/priv-app/Ims6/Ims6.apk 2>/dev/null | cut -d' ' -f1)
if [ -s "$MOD/system/system_ext/priv-app/Ims6/Ims6.apk" ]; then
  M=$(md5sum $MOD/system/system_ext/priv-app/Ims6/Ims6.apk | cut -d' ' -f1)
  [ "$A" = "$M" ] && ok "Ims6.apk in use is the module's apk" || bad "Ims6.apk in use differs from the module's apk"
fi
echo "INFO  mounts: $(grep -cE 'libims.lge.so|Ims6.apk' /proc/self/mountinfo) entries for libims/Ims6"
logcat -d -s QcloudVolte 2>/dev/null | tail -6 | sed 's/^/LOG   /'
logcat -d -s QcloudVolte 2>/dev/null | grep -q "LOADED" && ok "QcloudVolte class loaded" || bad "no 'LOADED' line yet (reboot, wait, airplane toggle)"
logcat -d -s QcloudVolte 2>/dev/null | grep -q "slot=0 state=[123]" && ok "slot 0 registered" || bad "slot 0 not registered in log"
logcat -d -s QcloudVolte 2>/dev/null | grep -q "slot=1 state=[123]" && ok "slot 1 registered" || bad "slot 1 not registered in log (single-SIM phone? then ignore)"
