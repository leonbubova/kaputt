## 1
`helm list -n wg` and `helm history shop -n wg`. Status of the latest revision?
## 2
See what changed: `helm get values shop -n wg` vs `helm get values shop -n wg --revision 1`.
## 3
`helm rollback shop 1 -n wg`. Then `helm status`.
