source ../../../lib/common.sh
$K create deploy web --image=nginx:1.27-alpine --replicas=2 --port=80 >/dev/null
$K expose deploy web --port=80 --target-port=80 >/dev/null
$K run box --image=busybox:1.36 -- sleep 3600 >/dev/null
