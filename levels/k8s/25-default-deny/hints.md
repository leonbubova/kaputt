## 1
Without a NetworkPolicy every pod can talk to every pod. As soon as a policy *selects* a pod, only traffic matching one of that policy's rules gets in — a policy with a selector and zero rules therefore blocks everything for the pods it selects. `kubectl explain networkpolicy.spec`.
## 2
`podSelector: {}` selects all pods in the namespace; `policyTypes: [Ingress]` says the policy is about incoming traffic; no `ingress:` list means no traffic is allowed. Dropped packets don't refuse, they time out — test with `kubectl run t --rm -it --restart=Never --image=busybox:1.36 -- wget -qO- -T 3 http://backend.wg.svc/`.
## 3
    kubectl apply -f - <<'Y'
    apiVersion: networking.k8s.io/v1
    kind: NetworkPolicy
    metadata: {name: default-deny-ingress}
    spec:
      podSelector: {}
      policyTypes: [Ingress]
    Y
