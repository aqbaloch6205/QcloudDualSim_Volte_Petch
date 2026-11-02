#!/usr/bin/env python3
"""Builds the release zips. Needs only Python 3 (no zip command).

  dist/QcloudVolte-Scripts.zip  scripts only (no LG files). Always built.
  dist/QcloudVolte-Module.zip   Magisk/KernelSU module. Built only when your own patched
                                files are in release-files/ (see release-files/README.txt).
"""
import hashlib, os, shutil, zipfile

ROOT = os.path.dirname(os.path.abspath(__file__))
os.chdir(ROOT)
APK = "release-files/Ims6.apk"
LIB = "release-files/libims.lge.so"
LIB_MD5 = "6cc81e7aaffafe13fcebf0a10171f20f"


def skip(name):
    return name.startswith("PUT_") or name.startswith(".")


def add_tree(z, src, arc_root=""):
    for dp, dns, fns in os.walk(src):
        dns[:] = [d for d in dns if not d.startswith(".")]
        for fn in fns:
            if skip(fn):
                continue
            full = os.path.join(dp, fn)
            arc = os.path.join(arc_root, os.path.relpath(full, src)).replace(os.sep, "/")
            z.write(full, arc)


shutil.rmtree("dist", ignore_errors=True)
os.makedirs("dist")
built = []

# scripts zip (no LG binaries)
with zipfile.ZipFile("dist/QcloudVolte-Scripts.zip", "w", zipfile.ZIP_DEFLATED) as z:
    add_tree(z, "scripts")
built.append("QcloudVolte-Scripts.zip")

# module zip (only with your own patched files)
have_files = os.path.isfile(APK) and os.path.getsize(APK) > 0 and os.path.isfile(LIB) and os.path.getsize(LIB) > 0
if have_files:
    md5 = hashlib.md5(open(LIB, "rb").read()).hexdigest()
    if md5 != LIB_MD5:
        print(f"WARNING: libims md5 is {md5}, expected {LIB_MD5}")
    with zipfile.ZipFile("dist/QcloudVolte-Module.zip", "w", zipfile.ZIP_DEFLATED) as z:
        add_tree(z, "module")
        z.write(APK, "system/system_ext/priv-app/Ims6/Ims6.apk")
        z.write(LIB, "system/system_ext/lib64/libims.lge.so")
        add_tree(z, "scripts", "scripts")
    built.append("QcloudVolte-Module.zip")
else:
    print("Module zip skipped: release-files/Ims6.apk or libims.lge.so is missing (see release-files/README.txt).")

with open("dist/MD5SUMS.txt", "w") as f:
    for name in built:
        h = hashlib.md5(open(os.path.join("dist", name), "rb").read()).hexdigest()
        f.write(f"{h}  {name}\n")
print(open("dist/MD5SUMS.txt").read())
print(f"built in {os.path.join(ROOT, 'dist')}")
