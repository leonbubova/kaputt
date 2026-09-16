## 1
A YAML file describes the pod; `kubectl apply -f FILE` makes the cluster build it. Copy the 8 lines exactly — two spaces per indent level, the `- name: web` line has the dash.
## 2
Save them as `~/.k8s-wargame/k8s/first.yaml` (any editor, e.g. `nano ~/.k8s-wargame/k8s/first.yaml` or VS Code), apply that file, then `kubectl get pods` until STATUS says Running. An `error parsing` message means an indent or a colon is off — compare line by line.
## 3
Put these 8 lines into `~/.k8s-wargame/k8s/first.yaml`:
    apiVersion: v1
    kind: Pod
    metadata:
      name: first
    spec:
      containers:
      - name: web
        image: nginx:1.27-alpine
then:
    kubectl apply -f ~/.k8s-wargame/k8s/first.yaml
    kubectl get pods
