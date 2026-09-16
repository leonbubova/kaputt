source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /opt/app
cat > /etc/profile.d/app-env.sh <<'P'
# environment for the app
APP_ENV=production
export APP_REGION=eu-central
P
cat > /opt/app/env-check <<'S'
#!/bin/bash
# env-check: refuses to run without APP_ENV
[ -n "$APP_ENV" ] || { echo "APP_ENV not set"; exit 1; }
echo "env=$APP_ENV region=${APP_REGION:-?}"
S
chmod 755 /opt/app/env-check
IN
