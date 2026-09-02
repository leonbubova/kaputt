# a firewall drops packets before the server ever sees them
Lesson: between the network and your process sits the kernel's packet filter. Every incoming packet walks the INPUT chain of iptables rules top to bottom; the first rule that matches decides — ACCEPT lets it through, DROP silently throws it away. Rules after the match are never consulted.
That "silently" is the diagnostic clue. A port with no listener answers "connection refused" at once. A port behind a DROP rule answers nothing: the client just hangs until it times out. Hang means firewall, refused means nobody listening.
Because first match wins, order matters. `-I` inserts a rule at the top of the chain, `-A` appends at the bottom. An ACCEPT inserted above a DROP wins; the same ACCEPT appended below it does nothing.
    iptables -L INPUT -n                              the INPUT chain, in order
    iptables -I INPUT -p tcp --dport PORT -j ACCEPT   insert an allow at the top
    iptables -D INPUT -p tcp --dport PORT -j DROP     delete a rule (same spec as when added)
    curl -s -m 3 localhost:PORT                       give up after 3s instead of hanging
Try it first: `iptables -L INPUT -n` — read it top to bottom, find the line that matches port 8080.
Your task: nginx serves "api ok" on 8080, yet connections hang. A firewall rule is dropping traffic to 8080. Add a rule that allows inbound TCP on 8080.
Check yourself:  wg check      stuck?  wg hint
