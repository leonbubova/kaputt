source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /opt/app /var/log/app
cat > /opt/app/run.sh <<'S'
#!/bin/bash
# app runner — logs to /var/log/app/app.log
echo "$(date -Is) started by $(id -un)" >> /var/log/app/app.log || exit 1
echo "run ok"
S
chmod 755 /opt/app/run.sh
chown root:root /var/log/app; chmod 755 /var/log/app
IN
