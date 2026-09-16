## 1
`Test.createTestingModule({ providers: [OrdersService] })` builds a tiny module. `OrdersService`'s constructor asks for `UsersService` — who provides it in that module?
## 2
In a unit test you don't want the real one. Provide a stand-in under the same token: `{ provide: UsersService, useValue: { ... } }`. Read `orders.service.ts` to see which method the tests need.
## 3
```
providers: [OrdersService, { provide: UsersService, useValue: { exists: (id: number) => id === 1 } }]
```
