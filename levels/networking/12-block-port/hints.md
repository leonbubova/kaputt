## 1
The firewall is a list of rules on the INPUT chain, checked top to bottom for every incoming packet; the first match decides. `iptables -L INPUT -n` shows the list — right now nothing mentions 9090.
## 2
A rule names a protocol, a destination port and a verdict: `-p tcp --dport 9090 -j DROP`. `-A INPUT` appends it to the chain.
## 3
`iptables -A INPUT -p tcp --dport 9090 -j DROP` — then `iptables -L INPUT -n` to see it listed.
