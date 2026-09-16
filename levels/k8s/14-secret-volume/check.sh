source ../../../lib/common.sh
[ "$($K get secret api-key -o jsonpath='{.data.token}' 2>/dev/null | base64 -d)" = abc123 ] || fail "secret api-key with token=abc123 missing"
$K get pod reader >/dev/null 2>&1 || fail "no pod reader"
$K get pod reader -o jsonpath='{.spec.volumes[*].secret.secretName}' | grep -qw api-key || fail "reader does not mount secret api-key as a volume"
t=60; [ -n "${WG_FAST:-}" ] && t=6; i=0
until [ "$($K get pod reader -o jsonpath='{.status.phase}' 2>/dev/null)" = Running ]; do sleep 2; i=$((i+2)); [ $i -ge $t ] && fail "reader is not Running"; done
got=$($K exec reader -- cat /etc/secret/token 2>/dev/null); [ "$got" = abc123 ] || fail "/etc/secret/token reads '$got'"
ok "reader sees the token at /etc/secret/token"
