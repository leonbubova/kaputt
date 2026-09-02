source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' 's/controllers: \[HealthController\],/controllers: [],/' "$APP/src/app.module.ts"
