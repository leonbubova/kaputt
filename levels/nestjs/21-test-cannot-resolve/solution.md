The TestingModule provides only `OrdersService`; its `UsersService` dependency has no provider in that context.
    orders.service.spec.ts → providers: [OrdersService, { provide: UsersService, useValue: { exists: (id) => id === 1 } }]
