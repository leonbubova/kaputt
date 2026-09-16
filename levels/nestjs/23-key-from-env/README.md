# ticket: api key from .env
"`ApiKeyGuard` hard-codes the key — ops rotates it per environment. Load it from `.env` (`API_KEY=…`, already in the project root) with `@nestjs/config`: `ConfigModule.forRoot({ isGlobal: true })` in `AppModule`, `ConfigService` injected into the guard." Goal: change `API_KEY` in `.env`, restart → the new key is accepted, the old one gets 401.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
