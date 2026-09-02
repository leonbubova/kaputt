A DROP rule blocks 8080; allow it.
    iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
