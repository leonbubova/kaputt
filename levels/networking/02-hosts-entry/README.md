# a hostname must resolve to an IP before anything can connect
Lesson: programs connect to IP addresses, never to names. Every time you type `api.internal`, the resolver first has to turn that name into an address — and if it can't, the connection fails before a single packet leaves the box, no matter how healthy the service is.
The resolver has two sources, checked in order: the static table in /etc/hosts first, then DNS. A name in neither resolves to nothing. For internal names that never change, /etc/hosts is the simplest place: one line per name, `IP  name`, and it takes effect immediately, no restart, no daemon.
`getent hosts NAME` asks the resolver exactly the way a program would, so it is the honest test — nslookup and dig only ask DNS and skip /etc/hosts.
    getent hosts api.internal            what does the name resolve to? (empty = nothing)
    cat /etc/hosts                       the static table, one `IP  name` per line
    echo 'IP name' >> /etc/hosts         append a static mapping
    curl -s api.internal:8080            connect by name
Try it first: `getent hosts localhost` — see the line, then find it in /etc/hosts.
Your task: internal tooling refers to the host `api.internal`, which should point at this box (127.0.0.1). Right now the name doesn't resolve at all. Add a hosts entry so it maps to 127.0.0.1.
Check yourself:  wg check      stuck?  wg hint
