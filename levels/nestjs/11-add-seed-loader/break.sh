source "$WG_ROOT/levels/nestjs/nest.sh"
cat > "$APP/src/users/users.service.ts" <<'TS'
import { forwardRef, Inject, Injectable, NotFoundException } from '@nestjs/common';
import { OrdersService } from '../orders/orders.service';
import { CreateUserDto } from './dto/create-user.dto';

export type Role = 'admin' | 'user';
export interface User { id: number; name: string; email: string; role: Role; }

@Injectable()
export class UsersService {
  private users: User[] = [
    { id: 1, name: 'Ada Lovelace', email: 'ada@example.com', role: 'admin' },
    { id: 2, name: 'Grace Hopper', email: 'grace@example.com', role: 'user' },
    { id: 3, name: 'Linus Torvalds', email: 'linus@example.com', role: 'user' },
  ];
  private nextId = 4;

  constructor(@Inject(forwardRef(() => OrdersService)) private readonly orders: OrdersService) {}

  findAll(role?: Role): User[] { return role ? this.users.filter((u) => u.role === role) : this.users; }

  findOne(id: number) {
    const user = this.users.find((u) => u.id === id);
    if (!user) throw new NotFoundException(`User ${id} not found`);
    return { ...user, orderCount: this.orders.countForUser(id) };
  }

  exists(id: number): boolean { return this.users.some((u) => u.id === id); }

  create(dto: CreateUserDto): User {
    const user: User = { id: this.nextId++, role: 'user', ...dto };
    this.users.push(user);
    return user;
  }

  count(): number { return this.users.length; }
}
TS
