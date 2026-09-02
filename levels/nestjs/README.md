# nestjs track
App: ~/.k8s-wargame/nestjs/app  (NestJS 11, TypeScript, in-memory data — reset on every level)
  npm run start:dev     # http://localhost:3200, watch mode
  npm test              # jest
  npx tsc --noEmit      # type check
`wg check` boots its own instance on port 3299 (respects PORT), so keep your dev server running.
Routes: /health · /users · /users/:id · /orders · /orders/:id · /admin/stats (X-Api-Key from .env)
