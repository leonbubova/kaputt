# ticket: give users its own module
"`AppModule` has grown into a grab bag — every controller and service is listed in it. Extract a `UsersModule` (`src/users/users.module.ts`) that owns `UsersController` + `UsersService`, and import it from `AppModule`. Everything must keep working — including orders and admin, which use `UsersService`." Goal: `users.module.ts` exists, `AppModule` imports it and no longer lists the users classes, all routes work.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
