# frontend shows "undefined" everywhere
"The frontend reads `response.data` — every endpoint used to answer `{ data: ... }`. Since the last refactor bodies come back bare (`[...]`, `{status:'ok'}`)." Goal: all successful responses are wrapped in `{ "data": ... }` again (`TransformInterceptor` exists in `src/common/`).
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
