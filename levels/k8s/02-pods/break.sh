source ../../../lib/common.sh
NOTES="$HOME/.k8s-wargame/k8s"; mkdir -p "$NOTES"; rm -f "$NOTES/demo.txt"
$K run demo --image=nginx:1.27-alpine >/dev/null
$K run worker --image=busybox:1.36 -- sleep 3600 >/dev/null
