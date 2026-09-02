Wrong port plus a firewall drop.
    listen 8080; (reload)  and  iptables -D INPUT -p tcp --dport 8080 -j DROP
