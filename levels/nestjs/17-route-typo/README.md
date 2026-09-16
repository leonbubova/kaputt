# user detail page is blank
"The frontend calls `GET /users/1` and gets `Cannot GET /users/1`. `GET /users` (the list) works." Goal: `GET /users/:id` returns the user; a non-numeric id is still rejected with 400.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
