source ../../../lib/common.sh
$K run keep --image=nginx:1.27-alpine >/dev/null
$K run bye --image=nginx:1.27-alpine >/dev/null
