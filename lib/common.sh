# shared helpers for levels — sourced by break.sh / check.sh
NS=wg
K="kubectl -n $NS"
ok()   { printf '\033[32m✔ %s\033[0m\n' "$*"; }
fail() { printf '\033[31m✘ %s\033[0m\n' "$*"; exit 1; }
info() { printf '\033[2m  %s\033[0m\n' "$*"; }
# wait until deployment has N available replicas (default 1)
# WG_FAST=1 → short timeouts (test harness, pre-fix check)
wait_available() { # deploy [replicas] [timeout]
  local want=${2:-1} t=${3:-60} i=0 got; [ -n "${WG_FAST:-}" ] && t=6
  while [ $i -lt $t ]; do
    got=$($K get deploy "$1" -o jsonpath='{.status.availableReplicas}' 2>/dev/null || echo 0)
    [ "${got:-0}" -ge "$want" ] && return 0
    sleep 2; i=$((i+2))
  done; return 1
}
# http GET from inside the cluster; prints body, exit 1 on failure
in_cluster_get() { # url [extra kubectl run args]
  local url=$1; shift
  kubectl -n $NS run wg-probe-$RANDOM --rm -i --restart=Never --image=busybox:1.36 \
    --quiet "$@" -- wget -qO- -T 5 "$url" 2>/dev/null
}
# no restarts over a window → stable
stable_for() { # label-selector seconds
  local before after
  before=$($K get pods -l "$1" -o jsonpath='{.items[*].status.containerStatuses[*].restartCount}')
  [ -n "${WG_FAST:-}" ] && set -- "$1" 6
  sleep "$2"
  after=$($K get pods -l "$1" -o jsonpath='{.items[*].status.containerStatuses[*].restartCount}')
  [ "$before" = "$after" ]
}
