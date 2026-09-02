import { Module } from '@nestjs/common';
import { OrdersModule } from '../orders/orders.module';
import { UsersModule } from '../users/users.module';
import { AdminController } from './admin.controller';
import { ApiKeyGuard } from './api-key.guard';

@Module({
  imports: [UsersModule, OrdersModule],
  controllers: [AdminController],
  providers: [ApiKeyGuard],
})
export class AdminModule {}
