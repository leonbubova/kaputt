## 1
Pending = no node accepted the pod. The scheduler tells you why: `kubectl describe pod <pod>` → Events.
## 2
"Insufficient cpu / memory": compare what the pod asks for with what a node has: `kubectl describe node <node>` → Allocatable.
## 3
Edit the resources on the deployment (`kubectl edit deploy worker`) to something a node can give — e.g. 100m cpu, 64Mi memory.
