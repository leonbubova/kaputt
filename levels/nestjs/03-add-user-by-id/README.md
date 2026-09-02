# ticket: user detail endpoint
"Add `GET /users/:id`. The id must be parsed as an integer (`ParseIntPipe` → 400 for `abc`), unknown ids answer 404 via `NotFoundException`." Goal: `/users/1` → Ada, `/users/abc` → 400, `/users/999` → 404.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
