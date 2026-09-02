import { forwardRef, Inject, Injectable, NotFoundException, OnModuleInit } from '@nestjs/common';
import { readFile } from 'node:fs/promises';
import { join } from 'node:path';
import { OrdersService } from '../orders/orders.service';
import { CreateUserDto } from './dto/create-user.dto';

export interface User { id: number; name: string; email: string; }

@Injectable()
export class UsersService implements OnModuleInit {
  private users: User[] = [];
  private nextId = 1;

  constructor(@Inject(forwardRef(() => OrdersService)) private readonly orders: OrdersService) {}

  async onModuleInit() {
    const raw = await readFile(join(process.cwd(), 'seed', 'users.json'), 'utf8');
    this.users = JSON.parse(raw);
    this.nextId = Math.max(...this.users.map((u) => u.id)) + 1;
  }

  findAll(): User[] { return this.users; }

  findOne(id: number) {
    const user = this.users.find((u) => u.id === id);
    if (!user) throw new NotFoundException(`User ${id} not found`);
    return { ...user, orderCount: this.orders.countForUser(id) };
  }

  exists(id: number): boolean { return this.users.some((u) => u.id === id); }

  create(dto: CreateUserDto): User {
    const user: User = { id: this.nextId++, ...dto };
    this.users.push(user);
    return user;
  }

  count(): number { return this.users.length; }
}
