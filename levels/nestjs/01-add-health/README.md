# ticket: add a health endpoint
"The load balancer needs `GET /health` → 200 `{ "status": "ok" }`. Put it in a new `HealthController` (`src/health/`) and register it in `AppModule`." Goal: `curl localhost:3200/health` answers with `status: ok`.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
