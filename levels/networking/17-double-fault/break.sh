source ../../../lib/common.sh; source ../lib.sh
site 'listen 8081;'; ngx_start
X iptables -A INPUT -p tcp --dport 8080 -j DROP
