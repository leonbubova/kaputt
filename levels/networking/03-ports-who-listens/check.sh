source ../../../lib/common.sh; source ../lib.sh
XS 'test -f /root/port.txt' || fail "no /root/port.txt in the box yet — find the port with ss -ltnp, echo the number into that file"
got=$(XS 'cat /root/port.txt' | tr -d ' \n\r')
[ "$got" = 4321 ] || fail "/root/port.txt says '$got' — that is not the port nc listens on (look at the Local Address:Port column)"
ok "port.txt says 4321 — you read a listening port off ss"
