No rule covers 9090; add a DROP for it.
    iptables -A INPUT -p tcp --dport 9090 -j DROP
