source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /opt/hello
cat > /opt/hello/say.sh <<'S'
#!/bin/bash
# writes the current time — proves cron ran
mkdir -p /var/lib/hello && date > /var/lib/hello/last
S
chmod 755 /opt/hello/say.sh
rm -f /etc/cron.d/hello; rm -rf /var/lib/hello
IN
X cron >/dev/null 2>&1 || true
