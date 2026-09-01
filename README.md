# k8s-wargame

A broken cluster, one level at a time. You fix it in your own terminal with plain `kubectl`.
Runs on a throwaway k3d cluster (k3s in Docker, 3 nodes) — Mac or station44, identical.

```
./install.sh            # docker/k3d/kubectl/helm + PATH
wg start                # cluster up (~30 s)
wg level 1              # briefing + something is broken now
kubectl get pods …      # your job
wg hint                 # 3 per level, counted
wg check                # green = solved → wg next
wg progress             # scoreboard: time, hints, spoiled
wg stop                 # cluster gone, machine clean
```

## Levels
| # | incident | what you learn |
|---|---|---|
| 01 | crashloop | describe → events → logs |
| 02 | imagepull | reading image refs, `set image` |
| 03 | pending | scheduler messages, requests vs allocatable |
| 04 | oomkilled | exit 137, limits |
| 05 | no endpoints | service = label selector |
| 06 | target port | port vs targetPort |
| 07 | missing secret | CreateContainerConfigError, secretKeyRef |
| 08 | configmap typo | mounted config, rollout restart |
| 09 | liveness kills | probes that lie |
| 10 | readiness | Ready ≠ Running, endpoints |
| 11 | rbac | 403, `auth can-i`, bindings |
| 12 | network policy | default deny, from-selectors |
| 13 | ingress 404 | ingress → service → endpoints |
| 14 | stuck rollout | replicasets, history, undo |
| 15 | node selector | labels on nodes |
| 16 | drain | cordon/drain, PDB |
| 17 | pvc pending | storageclasses, immutability |
| 18 | helm rollback | history, get values, rollback |

## Rules of the game
- `wg check` is the only judge. It verifies the outcome, not your method.
- Hints are counted, `wg spoil` marks the level. Both show in `wg progress`.
- Solve a level clean twice on different days before you call it learned (same spacing logic as the typing drills in `../monkeytype/v2`).

## Adding a level
`levels/NN-name/` with `README.md` (briefing), `break.sh` (sabotage, sourced with `lib/common.sh`), `check.sh` (exit 0 = solved),
`hints.md` (`## 1`/`## 2`/`## 3`), `solution.md`, optional `clean.sh` (cluster-scoped cleanup).
`test/run-all.sh` must stay green: it plays every level with its solution.
