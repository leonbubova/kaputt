source ../../../lib/common.sh; source ../lib.sh
site 'listen 8080;'; ngx_start
X iptables -A INPUT -p tcp --dport 8080 -j DROP
