# CI red: OrdersService spec can't compile the TestingModule
"`npm test` fails in `orders.service.spec.ts`: Nest can't resolve dependencies of the OrdersService. The service itself works in the app." Goal: `npm test` is green with all 4 tests in that spec — without pulling the real `UsersModule` and its seed loader into the unit test.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
