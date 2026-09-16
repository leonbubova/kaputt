source ../../../lib/common.sh; source ../lib.sh
f="$WGH/06-look-at-a-release/answer.txt"
[ -f "$f" ] || fail "no answer.txt in ~/.k8s-wargame/helm/06-look-at-a-release/ yet — find the environment, then: echo THE-WORD > answer.txt"
live=$(helm get values web -n $NS 2>/dev/null | awk '/^environment:/{print $2}')
[ -n "$live" ] || fail "release web lost its override — wg reset and try again"
got=$(awk 'NF{print $1; exit}' "$f")
[ "$got" = "$live" ] || fail "answer.txt says '$got' — that is not the environment release web runs with (helm get values web -n wg-helm)"
ok "right: web runs with environment=$live — you read it from the release, not from the chart"
