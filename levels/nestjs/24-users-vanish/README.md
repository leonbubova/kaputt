# users disappear between requests
"`POST /users` returns 201 with id 1, the next `GET /users/1` is 404. `GET /users` is `[]` — the seed users are gone too. No errors in the log. Started after someone 'optimized' the users service." Goal: seed users are listed and created users survive until restart.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
