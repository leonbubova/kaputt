`UsersModule` provides `UsersService` but no longer exports it, so `OrdersModule` (which imports `UsersModule`) cannot inject it.
    src/users/users.module.ts → exports: [UsersService]
