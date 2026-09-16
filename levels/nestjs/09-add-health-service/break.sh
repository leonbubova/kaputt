source "$WG_ROOT/levels/nestjs/nest.sh"
rm -f "$APP/src/health/health.service.ts"
sed -i '' "/health.service'/d; /^    HealthService,$/d" "$APP/src/app.module.ts"
cat > "$APP/src/health/health.controller.ts" <<'TS'
import { Controller, Get } from '@nestjs/common';

@Controller('health')
export class HealthController {
  @Get()
  check() {
    return { status: 'ok' };
  }
}
TS
