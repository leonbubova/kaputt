## 1
A liveness probe is the kubelet asking "are you alive?"; fail it a few times in a row and the kubelet kills and restarts the container — even if the app is fine and the probe just points at the wrong URL. `kubectl describe pod` → Events: who is killing the container, and why?
## 2
"Liveness probe failed: HTTP probe failed with statuscode: 404". The kubelet kills containers whose liveness probe fails. Does nginx have a /healthz?
## 3
Change the probe path to something that returns 200 (`/`), or remove the probe. `kubectl edit deploy web`.
