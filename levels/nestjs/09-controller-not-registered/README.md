# load balancer marks the api as down
"Health checks hit `GET /health` every 5 s and get 404 since the last deploy. The app itself boots fine and the other routes work." Goal: `GET /health` returns 200 with `status: ok`.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
