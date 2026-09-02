## 1
`helm history shop -n wg-helm`. A revision stuck in `pending-upgrade` is the lock. Nothing in the cluster is actually running that upgrade any more.
## 2
Way out: roll back to the last good revision — `helm rollback shop 1 -n wg-helm`. (The brutal alternative is deleting the release Secret `sh.helm.release.v1.shop.v2`.)
## 3
Then apply your change: `helm upgrade shop ./shop -n wg-helm --wait`.
