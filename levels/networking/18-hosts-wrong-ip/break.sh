source ../../../lib/common.sh; source ../lib.sh
site 'listen 8080;'; ngx_start
XS "grep -v api.internal /etc/hosts > /tmp/h; cat /tmp/h > /etc/hosts; echo '10.0.0.99 api.internal' >> /etc/hosts"
