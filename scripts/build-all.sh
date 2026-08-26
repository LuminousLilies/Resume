#!/usr/bin/env sh
# Build every application in every template. Used by `make all` and by CI.
set -eu

for app in applications/*.tex; do
  a=$(basename "$app" .tex)
  for tpl in templates/*.cls; do
    t=$(basename "$tpl" .cls)
    sh scripts/build.sh "$a" "$t"
  done
done
