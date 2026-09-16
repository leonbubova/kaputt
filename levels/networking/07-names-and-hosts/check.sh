source ../../../lib/common.sh; source ../lib.sh
XS 'test -f /root/lab-ip.txt' || fail "no /root/lab-ip.txt in the box yet — look up lab.internal, echo the address into that file"
got=$(XS 'cat /root/lab-ip.txt' | tr -d ' \n\r')
[ "$got" = 10.42.0.7 ] || fail "/root/lab-ip.txt says '$got' — that is not what lab.internal resolves to (getent hosts lab.internal)"
ok "lab-ip.txt says 10.42.0.7 — you resolved a name through /etc/hosts"
