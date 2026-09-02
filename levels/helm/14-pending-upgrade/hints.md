## 1
Helm serialises operations through the release record: a revision left in `pending-upgrade` acts as a lock, even when nothing in the cluster is actually running that upgrade any more (the client that started it is gone). `helm history shop -n wg-helm` shows the stuck revision.
## 2
Way out: roll back to the last good revision — `helm rollback shop 1 -n wg-helm`. (The brutal alternative is deleting the release Secret `sh.helm.release.v1.shop.v2`.)
## 3
Then apply your change: `helm upgrade shop ./shop -n wg-helm --wait`.
