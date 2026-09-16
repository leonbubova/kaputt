source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /opt/web/site /var/tmp/.x
echo "hello from web" > /opt/web/site/index.html
echo "nothing here" > /var/tmp/.x/index.html
cat > /opt/web/start.sh <<'S'
#!/bin/bash
# web service launcher
cd /opt/web/site || exit 1
exec python3 -m http.server 8080 --bind 127.0.0.1
S
chmod 755 /opt/web/start.sh
IN
XD python3 -m http.server 8080 --bind 127.0.0.1 --directory /var/tmp/.x
sleep 1
