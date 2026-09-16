source ../../../lib/common.sh; source ../lib.sh
X iptables -A INPUT -p icmp -j DROP
