Put your two modified files here, with exactly these names, then run:  sh build.sh
  Ims6.apk          the patched apk (smali/ applied, rebuilt, signed)  -> /system_ext/priv-app/Ims6/Ims6.apk
  libims.lge.so     the patched library (md5 6cc81e7aaffafe13fcebf0a10171f20f) -> /system/system_ext/lib64/libims.lge.so
These files are modified copies of LG's software and are NOT committed to git (see .gitignore).
Publish the built zips from dist/ with GitHub Releases instead.
