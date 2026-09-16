source ../../../lib/common.sh; source ../lib.sh
XS 'test -f /root/status.txt' || fail "no /root/status.txt in the box yet — ask curl for the code of /old, echo it into that file"
got=$(XS 'cat /root/status.txt' | tr -d ' \n\r')
[ "$got" = 404 ] || fail "/root/status.txt says '$got' — not what http://localhost:8080/old returns (use -o /dev/null -w '%{http_code}')"
ok "status.txt says 404 — you read an HTTP status code"
