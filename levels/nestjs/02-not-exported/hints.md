## 1
Read the error to the end: "...the argument UsersService at index [0] is available in the OrdersModule module". So OrdersModule can't see UsersService. Does it import UsersModule? Yes. Then what?
## 2
Importing a module gives you only what that module *exports*. Look at `src/users/users.module.ts`.
## 3
Add `exports: [UsersService]` to `UsersModule`.
