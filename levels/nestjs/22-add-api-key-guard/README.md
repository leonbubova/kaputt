# ticket: lock down /admin/stats
"`GET /admin/stats` is open to the world. Add a guard `ApiKeyGuard` (`src/admin/api-key.guard.ts`) that only lets requests through whose `X-Api-Key` header equals `wg-secret-key` (hard-code it for now, moving it to `.env` is the next ticket), everything else → 401 `UnauthorizedException`. Apply it to the whole `AdminController` with `@UseGuards`." Goal: correct key → 200 with stats, missing or wrong key → 401. Other routes stay open.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
