source "$WG_ROOT/levels/nestjs/nest.sh"
rm -f "$APP/src/users/users.module.ts" "$APP/src/orders/orders.module.ts" "$APP/src/admin/admin.module.ts"
cat > "$APP/src/app.module.ts" <<'TS'
import { Module } from '@nestjs/common';
import { APP_FILTER, APP_INTERCEPTOR } from '@nestjs/core';
import { ConfigModule } from '@nestjs/config';
import { HealthController } from './health/health.controller';
import { HealthService } from './health/health.service';
import { UsersController } from './users/users.controller';
import { UsersService } from './users/users.service';
import { OrdersController } from './orders/orders.controller';
import { OrdersService } from './orders/orders.service';
import { AdminController } from './admin/admin.controller';
import { ApiKeyGuard } from './admin/api-key.guard';
import { HttpExceptionFilter } from './common/http-exception.filter';
import { TransformInterceptor } from './common/transform.interceptor';

@Module({
  imports: [ConfigModule.forRoot({ isGlobal: true })],
  controllers: [HealthController, UsersController, OrdersController, AdminController],
  providers: [
    HealthService,
    UsersService,
    OrdersService,
    ApiKeyGuard,
    { provide: APP_FILTER, useClass: HttpExceptionFilter },
    { provide: APP_INTERCEPTOR, useClass: TransformInterceptor },
  ],
})
export class AppModule {}
TS
