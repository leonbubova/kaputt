source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' "/@nestjs\/config'/d; s/imports: \[ConfigModule.forRoot({ isGlobal: true }), /imports: [/" "$APP/src/app.module.ts"
cat > "$APP/src/admin/api-key.guard.ts" <<'TS'
import { CanActivate, ExecutionContext, Injectable, UnauthorizedException } from '@nestjs/common';
import { Request } from 'express';

@Injectable()
export class ApiKeyGuard implements CanActivate {
  canActivate(context: ExecutionContext): boolean {
    const req = context.switchToHttp().getRequest<Request>();
    const key = req.headers['x-api-key'];
    if (!key || key !== 'wg-secret-key') throw new UnauthorizedException('invalid api key');
    return true;
  }
}
TS
