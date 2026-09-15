#!/usr/bin/env bash
# learn/test phase contract: hints are free (hints=0) in levels ≤ LEARN_LEVELS and counted after; wg help prints the primer.
set -u; ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd); export WG_STATE=$(mktemp -d) WG_TRACK=bash WG_ROOT=$ROOT
source "$ROOT/levels/bash/track.sh"; source "$ROOT/levels/bash/solutions.sh"; WG="$ROOT/bin/wg"; fail=0
t(){ if eval "$2"; then echo "ok   $1"; else echo "FAIL $1"; fail=1; fi; }
$WG start >/dev/null
$WG level 1 >/dev/null; $WG hint | grep -q '(free)' || fail=1; s01 >/dev/null; $WG check >/dev/null
t "learn level: hints=0 after using a hint"   'grep -q "^bash/01-first-script solved .* hints=0$" "$WG_STATE/progress"'
$WG level 7 >/dev/null; $WG hint >/dev/null; s07 >/dev/null; $WG check >/dev/null
t "test level: hints=1 after using a hint"    'grep -q "^bash/07-numeric-compare solved .* hints=1$" "$WG_STATE/progress"'
t "wg help prints the primer"                  '$WG help | head -1 | grep -q "^# bash"'
t "wg list shows the learn/test divider"       '$WG list | grep -q "── test"'
t "learn README has Lesson + Your task"        'grep -q "^Lesson:" "$ROOT/levels/bash/01-first-script/README.md" && grep -q "^Your task:" "$ROOT/levels/bash/01-first-script/README.md"'
[ $fail = 0 ] && echo ALL GREEN || exit 1
