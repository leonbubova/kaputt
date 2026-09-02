## 1
`kubectl describe pod` → Events. Who is killing the container, and why?
## 2
"Liveness probe failed: HTTP probe failed with statuscode: 404". The kubelet kills containers whose liveness probe fails. Does nginx have a /healthz?
## 3
Change the probe path to something that returns 200 (`/`), or remove the probe. `kubectl edit deploy web`.
