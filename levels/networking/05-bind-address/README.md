# a listener binds to an address, not just a port
Lesson: a box has more than one IP address: 127.0.0.1 (loopback, reachable only from the box itself) and its real network address on eth0. When a server opens a port it also picks which address to accept connections on. Bound to 127.0.0.1 it hears only local clients; bound to 0.0.0.0 ("all interfaces") it hears everyone.
This is why "works on localhost, unreachable from other hosts" is a bind problem, not a firewall problem. `ss -ltn` shows the answer directly: the Local Address column reads `127.0.0.1:8080` or `0.0.0.0:8080`. In nginx, `listen 127.0.0.1:8080;` binds loopback only; `listen 8080;` binds all addresses.
One trap: a changed listen address needs a full stop and start. `nginx -s reload` keeps the old sockets open, so the new address never gets bound.
    ss -ltn                       Local Address column: 127.0.0.1 vs 0.0.0.0
    hostname -I                   the box's network address(es)
    curl -s IP:8080               test via the real address, not localhost
    nginx -s stop; nginx          full restart, needed after a bind change
Try it first: `hostname -I`, then `curl -s localhost:8080` and `curl -s THAT_IP:8080` — compare.
Your task: other hosts can't reach the API. It works from `curl localhost:8080` on the box, but not via the machine's own IP. nginx is bound to the loopback only. Make it listen on all interfaces.
Check yourself:  wg check      stuck?  wg hint
