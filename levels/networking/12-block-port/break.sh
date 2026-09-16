source ../../../lib/common.sh; source ../lib.sh
XS "iptables -D INPUT -p tcp --dport 9090 -j DROP 2>/dev/null; iptables -D INPUT -p tcp --dport 9090 -j REJECT 2>/dev/null; true"
