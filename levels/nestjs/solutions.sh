# machine-applied solutions, one function per level — used by run-all.sh only (restore the template file)
NEST_TPL=${WG_ROOT:-${ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}}/levels/nestjs/template
NEST_APP=$HOME/.k8s-wargame/nestjs/app
nest_restore(){ for f in "$@"; do mkdir -p "$(dirname "$NEST_APP/src/$f")"; cp "$NEST_TPL/src/$f" "$NEST_APP/src/$f"; done; }
s01(){ nest_restore health/health.controller.ts health/health.service.ts app.module.ts; }
s02(){ nest_restore health/health.controller.ts health/health.service.ts app.module.ts; }
s03(){ nest_restore users/users.controller.ts; }
s04(){ nest_restore users/users.controller.ts users/users.service.ts; }
s05(){ nest_restore users/users.controller.ts users/dto/create-user.dto.ts; }
s06(){ nest_restore app.module.ts users/users.module.ts orders/orders.module.ts admin/admin.module.ts; }
s07(){ nest_restore users/users.module.ts; }
s08(){ nest_restore users/users.module.ts; }
s09(){ nest_restore app.module.ts; }
s10(){ nest_restore users/users.controller.ts; }
s11(){ nest_restore users/users.service.ts; }
s12(){ nest_restore users/users.controller.ts; }
s13(){ nest_restore users/dto/create-user.dto.ts; }
s14(){ nest_restore admin/api-key.guard.ts; }
s15(){ nest_restore app.module.ts; }
s16(){ nest_restore common/http-exception.filter.ts; }
s17(){ nest_restore app.module.ts; }
s18(){ nest_restore main.ts; }
s19(){ nest_restore users/users.service.ts; }
s20(){ nest_restore users/users.module.ts orders/orders.module.ts users/users.service.ts orders/orders.service.ts; }
s21(){ nest_restore orders/orders.service.spec.ts; }
