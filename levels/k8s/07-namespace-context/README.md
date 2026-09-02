# namespaces split a cluster into rooms, and your context picks the default room
Lesson: a namespace is a room inside the cluster. Every namespaced object (pods, deployments, services, configmaps) lives in exactly one; names only need to be unique within it, and quotas or permissions can be set per room. Two teams can both own a `web` without colliding.
kubectl always acts in one namespace: the one you name with `-n`, or otherwise the default recorded in your current kubeconfig context. A context is a bundle of cluster + user + default namespace. Changing that default edits the kubeconfig on your machine, not the cluster — and it explains why a colleague's `kubectl get pods` shows different pods than yours.
    kubectl create namespace NAME                a new room
    kubectl get ns                               list namespaces
    kubectl create deployment NAME --image=IMG -n NS   act in a namespace explicitly
    kubectl config get-contexts                  contexts and their NAMESPACE column
    kubectl config set-context --current --namespace=NS   change the current context's default
    kubectl config view --minify                 the current context as stored
Try it first: `kubectl get pods -n kube-system` versus `kubectl get pods` — same cluster, different room.
Your task: ticket: "Team A gets their own space. Create namespace `team-a`, deploy `web` there (image `nginx:1.27-alpine`, 1 replica is fine), and switch your kubectl context so that `team-a` is the default namespace — we're tired of typing `-n`." Goal: deployment `web` is available in `team-a`, and `kubectl config view --minify` shows namespace `team-a`.
Check yourself:  wg check      stuck?  wg hint
