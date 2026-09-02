# ticket: load users from seed/users.json
"Content wants to edit the user list without a code change. `UsersService` must read `seed/users.json` (project root) once at startup — in a lifecycle hook, not the constructor — instead of the hard-coded array. Ids keep counting up after the last seeded one." Goal: add a user to `seed/users.json`, restart → it shows up in `GET /users`.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
