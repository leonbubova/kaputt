# make a pod from a file
Lesson: you tell Kubernetes what you want by writing it in a text file and handing the file over. The format
is called YAML: `key: value` lines, nested by indenting with two spaces (spaces matter, tabs are not allowed).
    kubectl apply -f FILE          "make the cluster look like this file" — creates the thing, or updates it if it exists
This is a complete pod, 8 lines. `kind` = what it is, `metadata.name` = its name, `spec` = what it should run;
`image` is the packaged program (here the nginx web server):
    apiVersion: v1
    kind: Pod
    metadata:
      name: first
    spec:
      containers:
      - name: web
        image: nginx:1.27-alpine
Your task: put exactly those 8 lines into the file `~/.k8s-wargame/k8s/first.yaml` (any editor; no leading spaces
on the first line), then hand it over:
    kubectl apply -f ~/.k8s-wargame/k8s/first.yaml
    kubectl get pods
Done when `kubectl get pods` shows `first` with STATUS `Running` (it may say ContainerCreating for a few seconds — run `get pods` again).
Where: your normal terminal. `wg start` already pointed `kubectl` at the wargame cluster, and namespace `wg` is your default — no extra flags needed.
Check yourself:  wg check      stuck?  wg hint
