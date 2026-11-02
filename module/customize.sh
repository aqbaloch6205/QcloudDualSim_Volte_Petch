#!/system/bin/sh
# QcloudVolte dual-SIM VoLTE: systemless module (files are mounted over the stock ones)
# Author: Abdul Qadeer (@Qcloudfx). Credits: Great Luke (@greatluke12), @Kiyomiyuki17.
APK=$MODPATH/system/system_ext/priv-app/Ims6/Ims6.apk
LIB=$MODPATH/system/system_ext/lib64/libims.lge.so

ui_print "- QcloudVolte dual-SIM VoLTE"
ui_print "- by Abdul Qadeer (@Qcloudfx)"

[ -s "$APK" ] || abort "! Ims6.apk missing in the module"
[ -s "$LIB" ] || abort "! libims.lge.so missing in the module"
rm -f $MODPATH/system/system_ext/priv-app/Ims6/PUT_*.txt $MODPATH/system/system_ext/lib64/PUT_*.txt

set_perm "$APK" 0 0 0644 u:object_r:system_file:s0
set_perm "$LIB" 0 0 0644 u:object_r:system_lib_file:s0
ui_print "- done. Reboot, wait 3-4 minutes, toggle airplane mode once."
