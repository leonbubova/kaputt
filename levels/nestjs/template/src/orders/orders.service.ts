import { forwardRef, Inject, Injectable, NotFoundException } from '@nestjs/common';
import { UsersService } from '../users/users.service';
import { CreateOrderDto } from './dto/create-order.dto';

export interface Order { id: number; userId: number; item: string; qty: number; }

@Injectable()
export class OrdersService {
  private orders: Order[] = [
    { id: 1, userId: 1, item: 'keyboard', qty: 1 },
    { id: 2, userId: 1, item: 'monitor', qty: 2 },
    { id: 3, userId: 2, item: 'mouse', qty: 1 },
  ];
  private nextId = 4;

  constructor(@Inject(forwardRef(() => UsersService)) private readonly users: UsersService) {}

  findAll(): Order[] { return this.orders; }

  findOne(id: number): Order {
    const order = this.orders.find((o) => o.id === id);
    if (!order) throw new NotFoundException(`Order ${id} not found`);
    return order;
  }

  create(dto: CreateOrderDto): Order {
    if (!this.users.exists(dto.userId)) throw new NotFoundException(`User ${dto.userId} not found`);
    const order: Order = { id: this.nextId++, ...dto };
    this.orders.push(order);
    return order;
  }

  countForUser(userId: number): number { return this.orders.filter((o) => o.userId === userId).length; }

  count(): number { return this.orders.length; }
}
