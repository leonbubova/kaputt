source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /opt/tools
cat > /opt/tools/healthcheck.sh <<'S'
#!/bin/bash
# post-deploy healthcheck — called by the deploy pipeline
[ -d /opt/tools ] && echo "healthcheck ok"
S
chmod 644 /opt/tools/healthcheck.sh
IN
