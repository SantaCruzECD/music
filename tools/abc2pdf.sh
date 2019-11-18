#!/bin/sh
set -x
FILE="$(basename "$1" .abc)"
TMP=./tmp
OUT=./output
DATE="$(date --iso=seconds)"
mkdir -p "$TMP"
mkdir -p "$OUT"
sed -e "s/@DATE@/$DATE/" < stamp.ps | ps2pdf - "$TMP/stamp.pdf"
abcm2ps -F fbook1.fmt -j 0b -O- "${FILE}.abc" | ps2pdf - - | pdftk - stamp $TMP/stamp.pdf output "${OUT}/${FILE}.pdf"

