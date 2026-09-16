source "$WG_ROOT/levels/nestjs/nest.sh"
cat > "$APP/src/users/users.module.ts" <<'TS'
import { Module } from '@nestjs/common';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';

@Module({
  controllers: [UsersController],
  providers: [UsersService],
  exports: [UsersService],
})
export class UsersModule {}
TS
cat > "$APP/src/users/users.service.ts" <<'TS'
import { Injectable, NotFoundException, OnModuleInit } from '@nestjs/common';
import { readFile } from 'node:fs/promises';
import { join } from 'node:path';
import { CreateUserDto } from './dto/create-user.dto';

export type Role = 'admin' | 'user';
export interface User { id: number; name: string; email: string; role: Role; }

@Injectable()
export class UsersService implements OnModuleInit {
  private users: User[] = [];
  private nextId = 1;

  async onModuleInit() {
    const raw = await readFile(join(process.cwd(), 'seed', 'users.json'), 'utf8');
    this.users = JSON.parse(raw);
    this.nextId = Math.max(...this.users.map((u) => u.id)) + 1;
  }

  findAll(role?: Role): User[] { return role ? this.users.filter((u) => u.role === role) : this.users; }

  findOne(id: number): User {
    const user = this.users.find((u) => u.id === id);
    if (!user) throw new NotFoundException(`User ${id} not found`);
    return user;
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
