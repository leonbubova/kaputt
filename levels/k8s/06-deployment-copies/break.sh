source ../../../lib/common.sh
$K create deploy web --image=nginx:1.27-alpine --replicas=1 >/dev/null
