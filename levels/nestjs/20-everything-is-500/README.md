# every error is a 500
"Frontend can't distinguish 'user not found' from a crash anymore: `GET /users/999` → 500, a bad id → 500, missing api key → 500. Started with the 'don't leak internals' hardening." Goal: 404 for unknown user, 400 for bad id, 401 without api key, 200 for valid requests — unexpected errors may stay 500.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
