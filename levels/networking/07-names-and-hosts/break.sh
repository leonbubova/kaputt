source ../../../lib/common.sh; source ../lib.sh
XS "grep -v lab.internal /etc/hosts > /tmp/h; cat /tmp/h > /etc/hosts; echo '10.42.0.7 lab.internal' >> /etc/hosts"
