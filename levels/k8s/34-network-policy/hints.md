## 1
Without policies every pod can talk to every pod; once a NetworkPolicy selects a pod, only traffic matching its rules gets in. Rules identify the *source* by labels, and a mismatch drops packets silently — a timeout, not a refusal. Reproduce: `kubectl run t --rm -it --image=busybox:1.36 --labels=role=frontend -- wget -qO- -T3 http://backend.wg.svc/`.
## 2
`kubectl get netpol` and `describe` the allow rule. Which label does it expect on the *source* pod?
## 3
`kubectl edit netpol allow-frontend-to-backend` — the podSelector under `from` must match exactly `role=frontend`.
