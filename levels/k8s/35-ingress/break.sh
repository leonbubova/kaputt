source ../../../lib/common.sh
$K create deploy web --image=nginx:1.27-alpine --port=80 >/dev/null
$K expose deploy web --port=80 >/dev/null
$K delete ingress web --ignore-not-found >/dev/null 2>&1 || true
