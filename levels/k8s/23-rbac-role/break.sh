source ../../../lib/common.sh
$K delete rolebinding reporter-reads-pods --ignore-not-found >/dev/null 2>&1 || true
$K delete role pod-reader --ignore-not-found >/dev/null 2>&1 || true
$K delete serviceaccount reporter --ignore-not-found >/dev/null 2>&1 || true
