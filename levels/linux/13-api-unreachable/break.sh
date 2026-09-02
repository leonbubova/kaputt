source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /opt/api-mock; echo "api ok" > /opt/api-mock/index.html
echo "10.99.0.1 api.internal   # temp override during migration" >> /etc/hosts
IN
XD python3 -m http.server 9100 --bind 127.0.0.1 --directory /opt/api-mock
sleep 1
