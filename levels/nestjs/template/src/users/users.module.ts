import { forwardRef, Module } from '@nestjs/common';
import { OrdersModule } from '../orders/orders.module';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';

@Module({
  imports: [forwardRef(() => OrdersModule)],
  controllers: [UsersController],
  providers: [UsersService],
  exports: [UsersService],
})
export class UsersModule {}
