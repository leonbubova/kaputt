## 1
Readiness is not liveness: a failing readiness probe restarts nothing, it marks the pod not-Ready and pulls it out of every Service. That's how a pod can be `Running` with `READY 0/1` and get no traffic. `kubectl describe pod` → Events / Conditions.
## 2
Which port does the probe check, which one does nginx listen on? A pod stays out of the endpoints until the probe passes.
## 3
Fix the probe port to 80: `kubectl edit deploy web`.
