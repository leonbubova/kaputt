## 1
A Deployment only replaces pods when its pod template changes; deleting pods by hand just makes the same ReplicaSet recreate them, and scaling to 0 is downtime. `kubectl get rs` — one ReplicaSet owns the current pods.
## 2
A rolling update creates a new ReplicaSet and shifts pods over one at a time, taking an old one down only after a new one is Ready. Any template change triggers it — kubectl has a command that changes nothing but a timestamp annotation. Watch it with `kubectl get pods -w`.
## 3
`kubectl rollout restart deploy/web`, then `kubectl rollout status deploy/web`. `kubectl get rs` now shows a new ReplicaSet with 2 and the old one with 0.
