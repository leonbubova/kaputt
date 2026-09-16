source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X test -f /root/i-am-in.txt 2>/dev/null || fail "no /root/i-am-in.txt on the box yet — wg shell, then create it there"
got=$(X cat /root/i-am-in.txt 2>/dev/null | tr -d '[:space:]'); [ "$got" = hello ] || fail "/root/i-am-in.txt contains '${got}' — it should contain just: hello"
ok "i-am-in.txt is on the box — you worked on another machine"
