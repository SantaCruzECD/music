#!/bin/sh
set -x
TMP=./tmp
OUT=./output
DATE="$(date --iso=seconds)"
rm -rf "$TMP" "$OUT"
mkdir -p "$TMP"
mkdir -p "$OUT"
mkdir -p "$OUT/src"
mkdir -p "$OUT/PDF"
sed -e "s/@DATE@/$DATE/" < tools/stamp.ps | ps2pdf - "$TMP/stamp.pdf"

for IF in "$@" ; do
    FILE="$(basename "$IF" .abc)"
    cp "${FILE}.abc" "$OUT/src"
    abcm2ps -F fbook1.fmt -j 0b -O- "${FILE}.abc" | ps2pdf - - | pdftk - stamp $TMP/stamp.pdf output "${OUT}/PDF/${FILE}.pdf"
done
