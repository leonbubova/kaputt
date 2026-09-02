source ../../../lib/common.sh
$K delete pod hello --ignore-not-found >/dev/null 2>&1 || true
