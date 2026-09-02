# ticket: filter users by role
"Support `GET /users?role=admin` (and `?role=user`). Without the query param the full list stays as is." Goal: `/users?role=admin` returns only admins (Ada), `/users` returns all 3.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
