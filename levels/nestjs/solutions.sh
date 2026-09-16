# machine-applied solutions, one function per level — used by run-all.sh only (restore the template file)
NEST_TPL=${WG_ROOT:-${ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}}/levels/nestjs/template
NEST_APP=$HOME/.k8s-wargame/nestjs/app
nest_restore(){ for f in "$@"; do mkdir -p "$(dirname "$NEST_APP/src/$f")"; cp "$NEST_TPL/src/$f" "$NEST_APP/src/$f"; done; }
# lessons 01–07 (what a beginner would type / write)
s01(){ printf '%s' '{"data":{"id":1,"name":"Ada Lovelace","email":"ada@example.com","role":"admin","orderCount":2}}' > "$NEST_APP/answer.txt"; }
s02(){ cat > "$NEST_APP/src/health/health.controller.ts" <<'TS'
import { Controller, Get } from '@nestjs/common';
import { HealthService } from './health.service';

@Controller('health')
export class HealthController {
  constructor(private readonly health: HealthService) {}

  @Get()
  check() {
    return { status: 'ok', uptime: this.health.uptime() };
  }

  @Get('ping')
  ping() {
    return 'pong';
  }
}
TS
}
s03(){ nest_restore health/health.controller.ts; sed -i '' "s/uptime: this.health.uptime() }/uptime: this.health.uptime(), version: 2 }/" "$NEST_APP/src/health/health.controller.ts"; }
s04(){ nest_restore health/health.controller.ts; }
s05(){ nest_restore health/health.controller.ts; }
s06(){ cat > "$NEST_APP/src/health/health.service.ts" <<'TS'
import { Injectable } from '@nestjs/common';

@Injectable()
export class HealthService {
  private readonly startedAt = Date.now();
  uptime(): number { return Math.round((Date.now() - this.startedAt) / 1000); }
  greeting() { return 'hello from the service'; }
}
TS
cat > "$NEST_APP/src/health/health.controller.ts" <<'TS'
import { Controller, Get } from '@nestjs/common';
import { HealthService } from './health.service';

@Controller('health')
export class HealthController {
  constructor(private readonly health: HealthService) {}

  @Get()
  check() {
    return { status: 'ok', uptime: this.health.uptime() };
  }

  @Get('greeting')
  greeting() { return this.health.greeting(); }
}
TS
}
s07(){ nest_restore app.module.ts; }
# tickets (formerly 01–27, shifted by 7)
s08(){ nest_restore health/health.controller.ts health/health.service.ts app.module.ts; }
s09(){ nest_restore health/health.controller.ts health/health.service.ts app.module.ts; }
s10(){ nest_restore users/users.controller.ts; }
s11(){ nest_restore users/users.controller.ts users/users.service.ts; }
s12(){ nest_restore users/users.controller.ts users/dto/create-user.dto.ts; }
s13(){ nest_restore app.module.ts users/users.module.ts orders/orders.module.ts admin/admin.module.ts; }
s14(){ nest_restore users/users.module.ts; }
s15(){ nest_restore users/users.module.ts; }
s16(){ nest_restore app.module.ts; }
s17(){ nest_restore users/users.controller.ts; }
s18(){ nest_restore users/users.service.ts; }
s19(){ nest_restore users/users.service.ts; }
s20(){ nest_restore users/users.controller.ts; }
s21(){ nest_restore users/dto/create-user.dto.ts; }
s22(){ nest_restore admin/api-key.guard.ts admin/admin.controller.ts admin/admin.module.ts; }
s23(){ nest_restore admin/api-key.guard.ts app.module.ts; }
s24(){ nest_restore admin/api-key.guard.ts; }
s25(){ nest_restore app.module.ts; }
s26(){ nest_restore common/http-exception.filter.ts app.module.ts; }
s27(){ nest_restore common/http-exception.filter.ts; }
s28(){ nest_restore app.module.ts; }
s29(){ nest_restore main.ts; }
s30(){ nest_restore main.ts; }
s31(){ nest_restore users/users.service.ts; }
s32(){ nest_restore users/users.module.ts users/users.service.ts; }
s33(){ nest_restore users/users.module.ts orders/orders.module.ts users/users.service.ts orders/orders.service.ts; }
s34(){ nest_restore orders/orders.service.spec.ts; }
