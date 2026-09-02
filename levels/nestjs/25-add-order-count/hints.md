## 1
Using a service from another module = import the module that exports it (`imports: [OrdersModule]` in `UsersModule`) and ask for it in the constructor. Do that, start the app, read the first red line.
## 2
`OrdersModule` already imports `UsersModule` — now the two import each other, and while one file is still loading the other class is `undefined` ("cannot create the … instance" / "circular dependency"). Nest resolves that lazily with `forwardRef(() => X)` — on both sides and on both levels: the module `imports` and the constructor parameter (`@Inject(forwardRef(() => OrdersService))`).
## 3
```
// users.module.ts:   imports: [forwardRef(() => OrdersModule)]
// users.service.ts:  constructor(@Inject(forwardRef(() => OrdersService)) private readonly orders: OrdersService) {}
//                    findOne: return { ...user, orderCount: this.orders.countForUser(id) };
```
(orders.module.ts / orders.service.ts already carry their forwardRef.)
