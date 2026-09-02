## 1
`curl localhost:8080` hangs. `iptables -L INPUT -n` shows a DROP for tcp dpt:8080.
## 2
Insert an ACCEPT rule before the DROP, or delete the DROP.
## 3
`iptables -I INPUT -p tcp --dport 8080 -j ACCEPT`
