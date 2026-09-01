#!/usr/bin/env bash
# plays every level: break → check must FAIL → solution → check must PASS
set -u; ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd); export WG_STATE=$(mktemp -d)
source "$ROOT/test/solutions.sh"; WG="$ROOT/bin/wg"; res=()
for d in "$ROOT"/levels/[0-9]*; do n=$(basename "$d" | cut -c1-2); [ -n "${1:-}" ] && [ "$1" != "$n" ] && continue
  echo "=== $(basename "$d")"
  $WG level "$((10#$n))" >/dev/null || { res+=("$n BREAK-FAILED"); continue; }
  if WG_FAST=1 $WG check >/dev/null 2>&1; then res+=("$n CHECK-PASSES-BEFORE-FIX"); continue; fi
  "s$n" >/dev/null 2>&1 || { res+=("$n SOLUTION-ERRORED"); continue; }
  if $WG check >/dev/null 2>&1; then res+=("$n ok"); else res+=("$n CHECK-FAILS-AFTER-FIX"); fi; echo "${res[${#res[@]}-1]}"
done
printf '%s\n' "${res[@]}"; printf '%s\n' "${res[@]}" | grep -vq ' ok$' && exit 1 || echo ALL GREEN
