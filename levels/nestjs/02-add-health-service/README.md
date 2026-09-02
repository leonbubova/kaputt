# ticket: /health should report uptime
"Move the logic out of the controller: add a `HealthService` (`@Injectable`) that remembers when the process started and returns `uptime` in seconds. Inject it into `HealthController` via the constructor. `GET /health` → `{ status: "ok", uptime: <number> }`." Goal: the endpoint returns a numeric `uptime`, provided by a service.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
