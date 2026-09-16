source ../../../lib/common.sh; source ../lib.sh
want=$(cip)
XS 'test -f /root/my-ip.txt' || fail "no /root/my-ip.txt in the box yet — wg shell, then echo the address into that file"
got=$(XS 'cat /root/my-ip.txt' | tr -d ' \n\r' | sed 's#/.*##')
[ "$got" = "$want" ] || fail "/root/my-ip.txt says '$got' — the eth0 inet address is $want"
ok "my-ip.txt holds $want — you found the box's address"
