#!/usr/bin/env sh
# Build one résumé: <app> in <template> -> $OUT/<app>--<template>.pdf
# Used by the Makefile (inside Docker) AND by CI (inside the TeX Live container),
# so the compile logic lives in exactly one place.
set -eu

APP="${1:?usage: build.sh <app> <template>}"
TEMPLATE="${2:?usage: build.sh <app> <template>}"
OUT="${OUT:-out}"
JOB="${APP}--${TEMPLATE}"

# Let LaTeX find templates/*.cls and common/*.tex by bare name.
export TEXINPUTS=".:./templates:./common:${TEXINPUTS:-}"
# Writable font cache (the image may run as an unprivileged user).
export TEXMFVAR="${TEXMFVAR:-/tmp/texmf-var}"

mkdir -p "$OUT"

# Inject the template + application as macros; resume.tex reads them.
run() {
  lualatex -interaction=nonstopmode -halt-on-error \
    -output-directory="$OUT" -jobname="$JOB" \
    "\\def\\template{${TEMPLATE}}\\def\\app{${APP}}\\input{resume.tex}"
}

# Twice, so position-dependent layout (\hfill against the page width) settles.
run
run

echo "Built $OUT/$JOB.pdf"
