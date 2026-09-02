# refuse any destructive kubectl op unless we are really on the throwaway cluster
assert_wargame_ctx() {
  local c; c=$(kubectl config current-context 2>/dev/null || true)
  case "$c" in
    k3d-wargame) : ;;
    *) echo "REFUSING: current kubectl context is '$c', not 'k3d-wargame'. wg only operates on its own disposable cluster. Run 'wg start' or switch context." >&2; exit 1 ;;
  esac
}
# track: kubernetes on k3d
CLUSTER=wargame
track_start() {
  if k3d cluster list 2>/dev/null | grep -q "^$CLUSTER "; then echo "cluster exists"; else
    k3d cluster create $CLUSTER --servers 1 --agents 2 -p "8080:80@loadbalancer" --wait; fi
  kubectl config use-context k3d-$CLUSTER >/dev/null
  kubectl wait --for=condition=Ready nodes --all --timeout=120s >/dev/null
  echo "pre-pulling images…"; for img in nginx:1.27-alpine busybox:1.36 python:3.12-alpine bitnamilegacy/kubectl:1.31; do
    docker pull -q "$img" >/dev/null 2>&1 && k3d image import -c $CLUSTER "$img" >/dev/null 2>&1 || true; done
}
track_stop() { k3d cluster delete $CLUSTER; }
track_ready() { kubectl cluster-info >/dev/null 2>&1; }
track_wipe() {  # before each level
  assert_wargame_ctx
  kubectl delete ns wg --ignore-not-found --wait=true >/dev/null 2>&1 || true
  local i=0; while kubectl get ns wg >/dev/null 2>&1; do sleep 1; i=$((i+1)); [ $i -gt 90 ] && { echo "namespace wg stuck terminating" >&2; exit 1; }; done
  kubectl create ns wg >/dev/null; kubectl config set-context --current --namespace=wg >/dev/null
}
