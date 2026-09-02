source ../../../lib/common.sh
$K create deploy web --image=nginx:1.27-alpine --replicas=2 --port=80 >/dev/null
$K rollout status deploy/web --timeout=90s >/dev/null
rs=$($K get rs -l app=web -o jsonpath='{.items[0].metadata.name}')
$K annotate deploy web wgbaseline="$rs" --overwrite >/dev/null
