#!/usr/bin/env bash
# Fetches the official Tailwind CSS v4 documentation (MDX, one file per property)
# from the tailwindcss.com repository and caches it next to this script's skill.
#
# Run from anywhere: bash skills/tailwind-docs/scripts/fetch-tailwind-docs.sh
# Idempotent — re-run to update to the latest docs.
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$SKILL_DIR/docs"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

git clone --depth 1 --filter=blob:none --sparse \
  https://github.com/tailwindlabs/tailwindcss.com "$TMP" >/dev/null 2>&1
git -C "$TMP" sparse-checkout set src/docs

mkdir -p "$OUT"
rm -f "$OUT"/*.mdx
cp "$TMP"/src/docs/*.mdx "$OUT"/
cp "$TMP"/src/docs/utils/colors.ts "$OUT"/ 2>/dev/null || true

echo "Cached $(ls "$OUT"/*.mdx | wc -l) Tailwind doc pages into $OUT"