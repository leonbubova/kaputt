source ../../../lib/common.sh
[ "$($K get secret db-credentials -o jsonpath='{.data.password}' 2>/dev/null | base64 -d)" = s3cret ] || fail "secret db-credentials with password=s3cret missing"
$K get pod api >/dev/null 2>&1 || fail "no pod api"
ref=$($K get pod api -o jsonpath='{.spec.containers[*].env[?(@.name=="DB_PASSWORD")].valueFrom.secretKeyRef.name}')
[ "$ref" = db-credentials ] || fail "DB_PASSWORD does not come from secretKeyRef db-credentials"
$K get pod api -o yaml | grep -q 's3cret' && fail "the password is written in plain text in the pod spec"
t=60; [ -n "${WG_FAST:-}" ] && t=6; i=0
until [ "$($K get pod api -o jsonpath='{.status.phase}' 2>/dev/null)" = Running ]; do sleep 2; i=$((i+2)); [ $i -ge $t ] && fail "api is not Running"; done
got=$($K exec api -- sh -c 'echo $DB_PASSWORD' 2>/dev/null); [ "$got" = s3cret ] || fail "DB_PASSWORD inside the pod is '$got'"
ok "api gets DB_PASSWORD from secret db-credentials"
