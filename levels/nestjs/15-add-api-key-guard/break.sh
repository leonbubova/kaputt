source "$WG_ROOT/levels/nestjs/nest.sh"
rm -f "$APP/src/admin/api-key.guard.ts"
sed -i '' "s/import { Controller, Get, UseGuards }/import { Controller, Get }/; /api-key.guard'/d; /@UseGuards(ApiKeyGuard)/d" "$APP/src/admin/admin.controller.ts"
sed -i '' "/api-key.guard'/d; /providers: \[ApiKeyGuard\],/d" "$APP/src/admin/admin.module.ts"
