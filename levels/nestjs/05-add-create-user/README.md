# ticket: create users
"Add `POST /users` taking a `CreateUserDto` (`src/users/dto/create-user.dto.ts`): `name` (string, ≥2 chars) and `email` (valid email) required, `role` optional. Validate with class-validator decorators — missing/invalid fields → 400, success → 201 (`@HttpCode`) with the created user." Goal: `POST {}` → 400, `POST {name,email}` → 201 and the user shows up in `GET /users`.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
