source ../../../lib/common.sh
$K delete pod api --ignore-not-found >/dev/null 2>&1 || true
$K delete secret db-credentials --ignore-not-found >/dev/null 2>&1 || true
