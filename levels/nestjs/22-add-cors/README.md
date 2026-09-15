# ticket: browser calls blocked by CORS
"The frontend on `http://localhost:5173` sees `No 'Access-Control-Allow-Origin' header` on every request; curl works fine. Enable CORS in `src/main.ts` for exactly that origin — not `*`. The frontend sends `Content-Type` and `X-Api-Key`." Goal: a preflight from `http://localhost:5173` is allowed, including the `X-Api-Key` header; any other origin is not.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
