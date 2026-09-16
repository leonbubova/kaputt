source "$WG_ROOT/levels/nestjs/nest.sh"
rm -rf "$APP/src/health"
sed -i '' "/health.controller'/d; /health.service'/d; /^    HealthService,$/d; s/controllers: \[HealthController\],/controllers: [],/" "$APP/src/app.module.ts"
