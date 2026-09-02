source ../../../lib/common.sh; source ../lib.sh
XS "grep -v api.internal /etc/hosts > /tmp/h; cat /tmp/h > /etc/hosts"
