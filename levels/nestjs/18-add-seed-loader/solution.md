`UsersService implements OnModuleInit`; `onModuleInit` reads `join(process.cwd(), 'seed', 'users.json')` with `readFile`, parses it into `this.users` and sets `nextId` from the highest id.
