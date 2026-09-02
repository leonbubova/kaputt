source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /opt/app /var/lib/appdata/db /var/lib/appdata/logs /var/lib/appdata/.cache/tmp
echo '{"v":1}' > /var/lib/appdata/db/meta.json
echo "$(date -Is) startup" > /var/lib/appdata/logs/app.log
dd if=/dev/zero of=/var/lib/appdata/.cache/tmp/core.4123 bs=1M count=100 2>/dev/null || true
cat > /opt/app/write-state <<'S'
#!/bin/bash
# persists app state to the data volume
mkdir -p /var/lib/appdata/db || exit 1
dd if=/dev/zero of=/var/lib/appdata/db/state.bin bs=1M count=2 status=none 2>/tmp/write-state.err || { cat /tmp/write-state.err; exit 1; }
echo "state written"
S
chmod 755 /opt/app/write-state
IN
