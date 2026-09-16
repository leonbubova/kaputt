source ../../../lib/common.sh; source ../lib.sh
XS 'test -f /root/ping.txt' || fail "no /root/ping.txt in the box yet — run the ping and send its output into that file with >"
XS 'grep -q "127.0.0.1" /root/ping.txt' || fail "/root/ping.txt does not mention 127.0.0.1 — ping that address"
XS 'grep -q "3 packets transmitted" /root/ping.txt' || fail "/root/ping.txt has no '3 packets transmitted' summary — use -c 3"
XS 'grep -q "3 received" /root/ping.txt' || fail "ping.txt says not all 3 answers came back — 127.0.0.1 always answers, try again"
ok "ping.txt shows 3 sent, 3 received — 127.0.0.1 is reachable"
