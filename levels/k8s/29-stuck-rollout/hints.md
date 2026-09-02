## 1
A rollout creates a new ReplicaSet and shifts pods over only as the new ones become Ready; if they never do, it hangs with both ReplicaSets alive and the old pods still serving. `kubectl rollout status deploy/web` and `kubectl get rs` — two ReplicaSets, one new and unhappy.
## 2
`kubectl rollout history deploy/web` shows revisions and change-causes.
## 3
`kubectl rollout undo deploy/web` (or `--to-revision=1`). Then `rollout status` until green.
