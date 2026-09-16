# admin stats: 500 "API_KEY is not configured"
"On Sarah's laptop `/admin/stats` works, on every other machine it's a 500 — even though `.env` contains `API_KEY=wg-secret-key`. Sarah has API_KEY exported in her shell." Goal: with a clean shell, `X-Api-Key: wg-secret-key` → 200, no key → 401.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
