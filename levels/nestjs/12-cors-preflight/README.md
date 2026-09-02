# browser: "Request header field x-api-key is not allowed by Access-Control-Allow-Headers"
"The frontend on `http://localhost:5173` gets CORS errors on `/admin/stats`. curl works fine. Other endpoints work in the browser too." Goal: the preflight for `/admin/stats` allows the `X-Api-Key` header (origin stays restricted to `http://localhost:5173`).
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
