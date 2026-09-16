source ../../../lib/common.sh
$K delete deploy web --ignore-not-found >/dev/null 2>&1 || true
