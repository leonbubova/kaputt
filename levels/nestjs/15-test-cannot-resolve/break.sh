source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' 's/providers: \[OrdersService, { provide: UsersService, useValue: usersMock }\],/providers: [OrdersService],/; /const usersMock = /d; /import { UsersService }/d' "$APP/src/orders/orders.service.spec.ts"
