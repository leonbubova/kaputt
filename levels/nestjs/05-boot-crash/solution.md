`onModuleInit` reads `join(__dirname, 'seed', 'users.json')` → `src/users/seed/users.json`, which does not exist; the async hook rejects and boot aborts.
    src/users/users.service.ts → join(process.cwd(), 'seed', 'users.json')
