# "Nest can't resolve dependencies of the OrdersService"
"Orders were working on Friday. Now the app refuses to boot and blames `OrdersService` — but nobody touched the orders folder." Goal: the app boots, `GET /orders` lists orders and `POST /orders` for user 1 works (unknown user → 404).
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
