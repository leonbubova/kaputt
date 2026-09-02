An iptables rule drops ICMP.
    iptables -D INPUT -p icmp -j DROP
