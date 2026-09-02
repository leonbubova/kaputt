source ../../../lib/common.sh; source ../lib.sh
f="$WORK/answer.txt"; [ -s "$f" ] || fail "no answer in $f"
want=$(cat "${WG_STATE:-$HOME/.k8s-wargame}/docker.20.secret")
[ "$(tr -d ' \n\r' < "$f")" = "$want" ] || fail "that's not the request id of the failed /checkout"
ok "request id found"
