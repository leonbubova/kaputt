# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/networking/lib.sh"
s01(){ ngx_start; }
s02(){ XS "echo '127.0.0.1 api.internal' >> /etc/hosts"; }
s03(){ site 'listen 8080;'; ngx_reload; }
s04(){ site 'listen 8080;'; ngx_reload; }
s05(){ X iptables -A INPUT -p tcp --dport 9090 -j DROP; }
s06(){ X iptables -I INPUT -p tcp --dport 8080 -j ACCEPT; }
s07(){ site 'listen 127.0.0.1:8080;'; ngx_stop; ngx_start; }
s08(){ site 'listen 8080;'; ngx_stop; ngx_start; }
s09(){ X iptables -D INPUT -p icmp -j DROP; }
s10(){ site 'listen 8080;'; ngx_reload; }
s11(){ XS "grep -v api.internal /etc/hosts > /tmp/h; cat /tmp/h > /etc/hosts; echo '127.0.0.1 api.internal' >> /etc/hosts"; }
s12(){ X pkill -f 'nc -lk' >/dev/null 2>&1 || true; sleep 1; }
s13(){ X pkill -f 'nc -lk' >/dev/null 2>&1 || true; sleep 1; ngx_start; }
s14(){ X ip addr add 10.99.0.5/32 dev eth0 >/dev/null 2>&1; }
s15(){ X ip link set eth0 mtu 1500 >/dev/null 2>&1; }
s16(){ site 'listen 8080;'; ngx_start; }
s17(){ site 'listen 8080;'; ngx_reload; X iptables -D INPUT -p tcp --dport 8080 -j DROP; }
