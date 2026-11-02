Put your two modified files in these exact paths, then run:  python3 release.py v1.0   (or python3 build.py to build only)
  release-files/system_ext/priv-app/Ims6/Ims6.apk      -> /system_ext/priv-app/Ims6/Ims6.apk
  release-files/system_ext/lib64/libims.lge.so         -> /system_ext/lib64/libims.lge.so  (md5 6cc81e7aaffafe13fcebf0a10171f20f)
These are modified copies of LG's software and are NOT committed to git (see .gitignore).
Outputs in dist/: QcloudVolte-Module.zip (Magisk/KernelSU), QcloudVolte-System-Installer.zip (copies into /system_ext via install_root.sh), QcloudVolte-Scripts.zip (scripts only).
