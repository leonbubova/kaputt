source ../../../lib/common.sh
kubectl delete ns team-a --ignore-not-found --wait=true >/dev/null 2>&1 || true
kubectl config set-context --current --namespace=$NS >/dev/null
