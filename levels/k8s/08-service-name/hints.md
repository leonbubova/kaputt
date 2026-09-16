## 1
`web` is a Service: a fixed name that forwards to the `web-…` pods. From inside any pod in the namespace, `http://web/` reaches it — no pod names, no IPs.
## 2
Get inside `box` with `kubectl exec -it box -- sh` (lesson 7). There, `wget -qO- http://web/` prints the page; `> /tmp/page.html` behind it saves it instead.
## 3
    kubectl exec -it box -- sh
    wget -qO- http://web/ > /tmp/page.html
    exit
