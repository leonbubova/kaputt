# api won't start after the users refactor
"Someone split `users` into its own module yesterday. Since then `npm run start:dev` dies at boot with a red Nest error." Goal: the app boots, `GET /users` lists the seed users and `GET /users/1` works.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
