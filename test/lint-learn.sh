#!/usr/bin/env bash
# learn-level README contract (docs/track-spec.md): title line, Lesson:, Your task:, exact last line, ≤ 260 words, no ## headers.
set -u; ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd); bad=0
for t in "$ROOT"/levels/*/; do
  n=$(grep -o 'LEARN_LEVELS=[0-9]*' "$t/track.sh" | cut -d= -f2)
  [ -n "$n" ] || n=$(( ($(ls -d "$t"[0-9]* | wc -l) + 1) / 2 ))
  for d in $(ls -d "$t"[0-9]* | head -"$n"); do f="$d/README.md"; e=""
    head -1 "$f" | grep -q '^# ' || e="$e no-title"
    grep -q '^Lesson:' "$f" || e="$e no-lesson"; grep -q '^Your task' "$f" || e="$e no-task"
    tail -2 "$f" | grep -qF 'Check yourself:  wg check      stuck?  wg hint' || e="$e bad-last-line"
    grep -q '^## ' "$f" && e="$e header"; w=$(wc -w < "$f" | tr -d ' '); [ "$w" -gt 260 ] && e="$e words=$w"
    [ -n "$e" ] && { echo "${d#$ROOT/}:$e"; bad=1; }
  done
done; [ $bad = 0 ] && echo ALL GREEN || exit 1
