# a Pod is the unit Kubernetes runs, and kubectl run starts one
Lesson: everything in Kubernetes ends up as a Pod — one or more containers that share an IP and a lifetime. It is the smallest thing the cluster schedules, starts, and reports on; every other object you will meet (Deployment, Service) exists to create or reach Pods.
For a one-off you do not need YAML. `kubectl run NAME --image=IMAGE` creates a single Pod directly, like `docker run` — except the cluster picks the node.
Every object lives in a namespace. Your kubectl context already defaults to `wg`, so plain commands land there without `-n wg`.
A new Pod passes through phases: `Pending` (no node yet, or image downloading), `ContainerCreating`, then `Running`. If it sits in an early phase, `describe` shows the Events that explain why.
    kubectl run NAME --image=IMAGE               create one pod from an image
    kubectl get pods                             list pods and their STATUS
    kubectl get pods -w                          watch status change live
    kubectl describe pod NAME                    details plus Events at the bottom
    kubectl get pod NAME -o jsonpath='{.spec.containers[0].image}'   print the exact image
Try it first: `kubectl config view --minify | grep namespace` — proof you are in `wg`.
Your task: ticket: "Before we build anything, I want to see one nginx running in namespace `wg`." Create a pod named `hello` with image `nginx:1.27-alpine`. Goal: the pod is `Running` with exactly that image.
Check yourself:  wg check      stuck?  wg hint
