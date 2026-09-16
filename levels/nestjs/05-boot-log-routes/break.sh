source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' "s/@Controller('health')/@Controller('healht')/" "$APP/src/health/health.controller.ts"   # log now says Mapped {/healht, GET}
