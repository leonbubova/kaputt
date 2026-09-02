# helm says deployed, pod says no
"`helm install` went through fine, `helm status web` is green, but the pod never starts. Kubernetes is complaining about the image."
Chart copy: `~/.k8s-wargame/helm/07-values-typo/web`. Goal: pod of release `web` running `nginx:1.27-alpine`, page reachable. Fix it through Helm (`helm get manifest web -n wg-helm` must show the right image).
