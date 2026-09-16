source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' "/health.controller'/d; s/controllers: \[HealthController\],/controllers: [],/" "$APP/src/app.module.ts"   # file stays, module forgets it
