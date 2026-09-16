source ../../../lib/common.sh
$K delete pod reader --ignore-not-found >/dev/null 2>&1 || true
$K delete secret api-key --ignore-not-found >/dev/null 2>&1 || true
