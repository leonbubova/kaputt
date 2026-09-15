# health endpoint answers 405
"Monitoring hits `GET /api/health` on the shop and gets `405 Method Not Allowed` since the last deploy. The route file is there, nobody touched the monitoring."
App: `~/.k8s-wargame/nextjs/app` — `npm run dev` (port 3100), `npm run build`, `npm test`. Goal: `GET /api/health` returns 200 with `{"ok":true,…}`.
