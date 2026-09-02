NS=${NS:-wg-helm}
# track: helm on the same k3d cluster as the k8s track; play area = namespace wg-helm
source "$WG_ROOT/levels/k8s/track.sh"
track_wipe() {  # before each level
  assert_wargame_ctx
  local ns=wg-helm r i=0
  for r in $(helm list -n $ns -q --deployed --failed --pending --uninstalled --uninstalling --superseded 2>/dev/null); do helm uninstall "$r" -n $ns --no-hooks >/dev/null 2>&1 || true; done
  kubectl delete ns $ns --ignore-not-found --wait=true >/dev/null 2>&1 || true
  while kubectl get ns $ns >/dev/null 2>&1; do sleep 1; i=$((i+1)); [ $i -gt 90 ] && { echo "namespace $ns stuck terminating" >&2; exit 1; }; done
  kubectl create ns $ns >/dev/null; kubectl config set-context --current --namespace=$ns >/dev/null
}
