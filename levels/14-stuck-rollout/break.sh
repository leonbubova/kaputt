source ../../lib/common.sh
$K create deploy web --image=nginx:1.27-alpine --replicas=3 --port=80 >/dev/null
$K rollout status deploy/web --timeout=90s >/dev/null
$K set image deploy/web nginx=nginx:2.0-alpine >/dev/null
$K annotate deploy web kubernetes.io/change-cause="release v2 (nginx 2.0)" --overwrite >/dev/null
