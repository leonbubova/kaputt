source ../../../lib/common.sh
$K create deploy web --image=nginx:1.27-alpine --replicas=1 --port=80 >/dev/null
$K delete svc web --ignore-not-found >/dev/null 2>&1 || true
