source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /opt/mock; echo "mock ok" > /opt/mock/index.html
grep -v mock.internal /etc/hosts > /tmp/h; cat /tmp/h > /etc/hosts
pkill -f 'http.server 9200' 2>/dev/null || true
IN
XD python3 -m http.server 9200 --bind 127.0.0.1 --directory /opt/mock
sleep 1
