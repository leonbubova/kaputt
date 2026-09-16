source ../../../lib/common.sh
NOTES="$HOME/.k8s-wargame/k8s"; mkdir -p "$NOTES"; rm -f "$NOTES/first.yaml"
$K delete pod first --ignore-not-found >/dev/null 2>&1 || true
