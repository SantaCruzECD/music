#!/bin/sh
set -x
FILE="$(basename "$1" .abc)"
DIR="$(dirname "$1")"
abcm2ps -F fbook1.fmt -j 0b -O- "${DIR}"/"${FILE}".abc | ps2pdf - "${DIR}"/"${FILE}".pdf

