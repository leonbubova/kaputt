# created users have no email
"`POST /users {name, email}` returns 201 — but the email is missing in the response and in `GET /users`. And a garbage email is accepted." Goal: created users keep their email, an invalid email is rejected with 400, and unknown fields (e.g. `role`) are still dropped.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
