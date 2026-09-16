source "$WG_ROOT/levels/nestjs/nest.sh"
# "cleanup": someone removed the forwardRef() wrappers everywhere
sed -i '' 's/imports: \[forwardRef(() => OrdersModule)\],/imports: [OrdersModule],/; s/import { forwardRef, Module }/import { Module }/' "$APP/src/users/users.module.ts"
sed -i '' 's/imports: \[forwardRef(() => UsersModule)\],/imports: [UsersModule],/; s/import { forwardRef, Module }/import { Module }/' "$APP/src/orders/orders.module.ts"
sed -i '' 's/constructor(@Inject(forwardRef(() => OrdersService)) private readonly orders: OrdersService)/constructor(private readonly orders: OrdersService)/; s/import { forwardRef, Inject, Injectable, NotFoundException, OnModuleInit }/import { Injectable, NotFoundException, OnModuleInit }/' "$APP/src/users/users.service.ts"
sed -i '' 's/constructor(@Inject(forwardRef(() => UsersService)) private readonly users: UsersService)/constructor(private readonly users: UsersService)/; s/import { forwardRef, Inject, Injectable, NotFoundException }/import { Injectable, NotFoundException }/' "$APP/src/orders/orders.service.ts"
