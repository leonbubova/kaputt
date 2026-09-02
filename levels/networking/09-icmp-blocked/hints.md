## 1
ping is not TCP — it is ICMP, its own protocol, and a firewall can drop it while every service keeps working. `ping -c1 127.0.0.1` fails. Look at the firewall: `iptables -L INPUT -n`.
## 2
There is a `DROP` rule for protocol icmp on the INPUT chain.
## 3
Remove it: `iptables -D INPUT -p icmp -j DROP`.
