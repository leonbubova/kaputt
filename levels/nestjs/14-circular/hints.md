## 1
`UsersModule` imports `OrdersModule` and `OrdersModule` imports `UsersModule`; `UsersService` injects `OrdersService` and vice versa. At `import` time one of the two classes is still `undefined` — that is the "cannot create ... instance" / "circular dependency" error.
## 2
Nest resolves this lazily with `forwardRef(() => X)` — on **both** sides, and on **both** levels: module `imports` and the constructor parameter (`@Inject(forwardRef(() => OrdersService))`).
## 3
```
imports: [forwardRef(() => OrdersModule)]                      // users.module.ts (and mirror in orders.module.ts)
constructor(@Inject(forwardRef(() => OrdersService)) private readonly orders: OrdersService) {}   // users.service.ts (mirror in orders.service.ts)
```
