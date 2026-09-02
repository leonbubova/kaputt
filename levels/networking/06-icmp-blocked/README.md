# ping is ICMP, a protocol of its own that the firewall filters separately
Lesson: ping does not use a port. It sends ICMP echo requests, a different protocol from TCP and UDP, and a firewall rule can match on protocol alone with `-p icmp`. So every ping can be dropped while every TCP service keeps working — dead to a monitor, healthy to its users.
"The host doesn't answer pings" is therefore not evidence that the host or its services are down. It only says ICMP is not getting through, and the INPUT chain is where to look: a DROP line for `icmp` sits there regardless of the tcp rules around it.
Fixing a bad rule means deleting it rather than stacking a workaround on top. `iptables -D` removes a rule; give it the same match as when it was added, or its line number.
    ping -c1 -W2 127.0.0.1                 one ping, 2s timeout — loopback goes through INPUT too
    iptables -L INPUT -n                   list the chain; look at the protocol column
    iptables -D INPUT <spec> -j DROP       delete the rule with that spec
    iptables -L INPUT -n --line-numbers    numbered view; iptables -D INPUT N deletes by number
Try it first: `curl -s localhost:8080` and `ping -c1 -W2 127.0.0.1` — TCP fine, ICMP not.
Your task: the uptime monitor pings this box and gets nothing back, though services are fine. Something is dropping ICMP. Make the host answer pings again.
Check yourself:  wg check      stuck?  wg hint
