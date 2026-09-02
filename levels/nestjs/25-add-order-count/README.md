# ticket: user detail should show the order count
"`GET /users/:id` must include `orderCount` — `OrdersService.countForUser(id)` already computes it. `UsersService` lives in `UsersModule`, `OrdersService` in `OrdersModule`, and orders already depend on users (`POST /orders` checks the user exists)." Goal: `/users/1` → `orderCount: 2`, after a `POST /orders` for user 1 → `3`; `POST /orders` for an unknown user stays 404.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
