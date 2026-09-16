source ../../../lib/common.sh
$K delete pod greeter --ignore-not-found >/dev/null 2>&1 || true
$K delete cm app-config --ignore-not-found >/dev/null 2>&1 || true
