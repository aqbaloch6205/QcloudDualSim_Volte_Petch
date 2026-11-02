#!/bin/sh
# Patches a STOCK libims.lge.so (Infinity X 4.1 A17 build) into the dual-SIM VoLTE one. LG's file is not shipped in this repo.
# Usage: sh patch_libims.sh /path/to/stock/libims.lge.so /path/to/output/libims.lge.so
# Author: Abdul Qadeer (@Qcloudfx)
IN="$1"; OUT="$2"
ORIG_MD5=2b4ce6ca5a045f949fd1569266da3d91
PATCHED_MD5=6cc81e7aaffafe13fcebf0a10171f20f
[ -n "$IN" ] && [ -n "$OUT" ] && [ -f "$IN" ] || { echo "usage: sh $0 <stock libims.lge.so> <output file>"; exit 1; }
SUM=$(md5sum "$IN" | cut -d' ' -f1)
[ "$SUM" = "$ORIG_MD5" ] || { echo "Not the supported build (md5 $SUM, expected $ORIG_MD5). Nothing written."; exit 1; }
cp "$IN" "$OUT" || exit 1
# 0x6d5754 (7165780): mov w0,#1 ; ret          IsMultiImsEnabled()
printf '\040\000\200\122\300\003\137\326' | dd of="$OUT" bs=1 seek=7165780 conv=notrunc 2>/dev/null
# 0xa83c68 (11025512): mov w20,#1              AoSServiceAvailableCellular::CheckServiceAvailable()
printf '\064\000\200\122' | dd of="$OUT" bs=1 seek=11025512 conv=notrunc 2>/dev/null
NEW=$(md5sum "$OUT" | cut -d' ' -f1)
[ "$NEW" = "$PATCHED_MD5" ] && echo "OK: $OUT (md5 $NEW)" || { echo "patch check failed ($NEW)"; rm -f "$OUT"; exit 1; }
