## 1
A request has to clear several layers in order — the firewall, then a listener on the port — and each fails differently, so fix them one at a time and re-test after each. Two problems: the vhost isn't on 8080, and a firewall rule blocks 8080. `ss -ltn` and `iptables -L INPUT -n`.
## 2
The listen directive says 8081, and there's a DROP for tcp dpt:8080.
## 3
Set `listen 8080;` (reload), and `iptables -D INPUT -p tcp --dport 8080 -j DROP`.
