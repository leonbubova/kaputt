## 1
READY 0/1 with Running = readiness probe failing. `kubectl describe pod` → Events / Conditions.
## 2
A pod that isn't Ready is removed from Service endpoints. Which port does the probe check, which one does nginx listen on?
## 3
Fix the probe port to 80: `kubectl edit deploy web`.
