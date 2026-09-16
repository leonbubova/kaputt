## 1
A constructor can't be `async`, and Nest isn't ready yet while it runs. For startup work a provider implements `OnModuleInit` (from `@nestjs/common`): `async onModuleInit() { … }` — Nest awaits it before it starts serving requests.
## 2
Read with `readFile` from `node:fs/promises` and build the path from the project root, not the source file: `join(process.cwd(), 'seed', 'users.json')` (`process.cwd()` = where `npm run start:dev` was launched). `JSON.parse` into `this.users`, then `nextId = max(id) + 1`.
## 3
```
export class UsersService implements OnModuleInit {
  private users: User[] = [];
  private nextId = 1;
  async onModuleInit() {
    this.users = JSON.parse(await readFile(join(process.cwd(), 'seed', 'users.json'), 'utf8'));
    this.nextId = Math.max(...this.users.map((u) => u.id)) + 1;
  }
```
