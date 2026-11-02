Scripts for people who do not want to use the module (or for checking it). All need root except the adb ones, which need root on the phone.
  check.sh          su -c "sh check.sh"         -> PASS/FAIL report (module, files in use, QcloudVolte log)
  install_root.sh   su -c "sh install_root.sh"  -> replaces the stock Ims6.apk / libims.lge.so (backup in /sdcard/QcloudVolte_backup). Disable the module first.
  restore_root.sh   su -c "sh restore_root.sh"  -> puts the stock files back
  install_adb.sh / install_adb.bat               -> same as install_root.sh but started from a PC over adb
Put Ims6.apk and libims.lge.so next to the script (inside the module they are found automatically).
