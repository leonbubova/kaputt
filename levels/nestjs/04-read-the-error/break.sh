source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' "s/status: 'ok', uptime:/status: 'ok' uptime:/" "$APP/src/health/health.controller.ts"   # drop the comma → TS1005 at boot
