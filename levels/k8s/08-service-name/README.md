# a Service: one stable name for many pods
Lesson: the pods of a Deployment come and go, and each new one gets a new random name — nothing can rely on
those names. A Service is a fixed name in front of them: talk to the Service, it forwards to whichever pods
belong to it. Inside the cluster the name works like a website address: `http://web/` reaches the Service `web`.
    kubectl get services           NAME, TYPE, its fixed cluster IP, PORT(S)
Try it — Deployment `web` (2 copies of the nginx web server), a Service `web`, and the pod `box` exist:
    kubectl get services
    kubectl get pods
    kubectl exec -it box -- sh
    wget -qO- http://web/
    exit
`wget -qO- ADDRESS` fetches a web page and prints it (`-q` quiet, `-O-` to the screen). You see nginx's welcome page —
served by one of the two `web-…` pods, through the Service.
Your task: inside `box`, save that page into the file `/tmp/page.html`: the same `wget` line with `> /tmp/page.html`
behind it, typed at the `/ #` prompt. Then `exit`.
Where: your normal terminal. `wg start` already pointed `kubectl` at the wargame cluster, and namespace `wg` is your default — no extra flags needed.
Check yourself:  wg check      stuck?  wg hint
