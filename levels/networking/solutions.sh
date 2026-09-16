# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/networking/lib.sh"
s01(){ XS 'hostname -I | awk "{print \$1}" > /root/my-ip.txt'; }
s02(){ XS 'ping -c 3 127.0.0.1 > /root/ping.txt'; }
s03(){ XS 'echo 4321 > /root/port.txt'; }
s04(){ XS 'echo 404 > /root/status.txt'; }
s05(){ ngx_stop; ngx_start; sleep 1; }
s06(){ site 'listen 8081;'; ngx_reload; }
s07(){ XS 'echo 10.42.0.7 > /root/lab-ip.txt'; }
s08(){ ngx_start; }
s09(){ XS "echo '127.0.0.1 api.internal' >> /etc/hosts"; }
s10(){ site 'listen 8080;'; ngx_reload; }
s11(){ site 'listen 8080;'; ngx_reload; }
s12(){ X iptables -A INPUT -p tcp --dport 9090 -j DROP; }
s13(){ X iptables -I INPUT -p tcp --dport 8080 -j ACCEPT; }
s14(){ site 'listen 127.0.0.1:8080;'; ngx_stop; ngx_start; }
s15(){ site 'listen 8080;'; ngx_stop; ngx_start; }
s16(){ X iptables -D INPUT -p icmp -j DROP; }
s17(){ site 'listen 8080;'; ngx_reload; }
s18(){ XS "grep -v api.internal /etc/hosts > /tmp/h; cat /tmp/h > /etc/hosts; echo '127.0.0.1 api.internal' >> /etc/hosts"; }
s19(){ X pkill -f 'nc -lk' >/dev/null 2>&1 || true; sleep 1; }
s20(){ X pkill -f 'nc -lk' >/dev/null 2>&1 || true; sleep 1; ngx_start; }
s21(){ X ip addr add 10.99.0.5/32 dev eth0 >/dev/null 2>&1; }
s22(){ X ip link set eth0 mtu 1500 >/dev/null 2>&1; }
s23(){ site 'listen 8080;'; ngx_start; }
s24(){ site 'listen 8080;'; ngx_reload; X iptables -D INPUT -p tcp --dport 8080 -j DROP; }
