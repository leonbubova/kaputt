## 1
A module is an empty class with `@Module({ controllers, providers, imports, exports })`. Move `UsersController`/`UsersService` out of `AppModule` into `src/users/users.module.ts`, then `imports: [UsersModule]` in `AppModule`.
## 2
Boot fails with "can't resolve dependencies of the OrdersService (?)". Providers are private to their module — `AppModule` (where `OrdersService` still lives) only sees what `UsersModule` **exports**.
## 3
```
@Module({ controllers: [UsersController], providers: [UsersService], exports: [UsersService] })
export class UsersModule {}
// app.module.ts: imports: [ConfigModule.forRoot({ isGlobal: true }), UsersModule], remove UsersController/UsersService from the lists
```
(Bonus: do the same for orders and admin.)
