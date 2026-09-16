## 1
A chart is nothing but a folder with `Chart.yaml`, `values.yaml` and `templates/` inside. `helm create NAME` writes that folder for you, filled with a working nginx example.
## 2
Stand in the work dir first (`cd ~/.k8s-wargame/helm/01-what-is-a-chart`), then run `helm create` with the name `hello`. Afterwards `ls` shows two folders: `demo` and `hello`.
## 3
    cd ~/.k8s-wargame/helm/01-what-is-a-chart
    helm create hello
