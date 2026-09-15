source ../../../lib/common.sh
$K create deploy backend --image=nginx:1.27-alpine --port=80 >/dev/null
$K expose deploy backend --port=80 >/dev/null
$K delete netpol default-deny-ingress --ignore-not-found >/dev/null 2>&1 || true
$K rollout status deploy/backend --timeout=90s >/dev/null
