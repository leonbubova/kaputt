import { Controller, Get, UseGuards } from '@nestjs/common';
import { OrdersService } from '../orders/orders.service';
import { UsersService } from '../users/users.service';
import { ApiKeyGuard } from './api-key.guard';

@Controller('admin')
@UseGuards(ApiKeyGuard)
export class AdminController {
  constructor(private readonly users: UsersService, private readonly orders: OrdersService) {}

  @Get('stats')
  stats() {
    return { users: this.users.count(), orders: this.orders.count() };
  }
}
