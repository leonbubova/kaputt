# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/networking/lib.sh"
s01(){ ngx_start; }
s02(){ XS "echo '127.0.0.1 api.internal' >> /etc/hosts"; }
s03(){ site 'listen 8080;'; ngx_reload; }
s04(){ X iptables -I INPUT -p tcp --dport 8080 -j ACCEPT; }
s05(){ site 'listen 8080;'; ngx_stop; ngx_start; }
s06(){ X iptables -D INPUT -p icmp -j DROP; }
s07(){ site 'listen 8080;'; ngx_reload; }
s08(){ XS "grep -v api.internal /etc/hosts > /tmp/h; cat /tmp/h > /etc/hosts; echo '127.0.0.1 api.internal' >> /etc/hosts"; }
s09(){ X pkill -f 'nc -lk' >/dev/null 2>&1 || true; sleep 1; ngx_start; }
s10(){ X ip link set eth0 mtu 1500 >/dev/null 2>&1; }
s11(){ site 'listen 8080;'; ngx_start; }
s12(){ site 'listen 8080;'; ngx_reload; X iptables -D INPUT -p tcp --dport 8080 -j DROP; }
