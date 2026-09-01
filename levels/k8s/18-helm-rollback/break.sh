source ../../../lib/common.sh
command -v helm >/dev/null || { echo "helm missing — install it (brew install helm)"; exit 1; }
helm install shop ./chart -n $NS --wait --timeout 90s >/dev/null
helm upgrade shop ./chart -n $NS --set image=nginx:1.27-alpine-perl-broken --set replicas=2 --wait --timeout 25s >/dev/null 2>&1 || true
