# admin stats always 401
"`GET /admin/stats` with header `X-Api-Key: wg-secret-key` (the value in `.env`) returns 401 `invalid api key` — for everyone, from curl and from the frontend." Goal: correct key → 200 with stats, missing/wrong key → 401.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
