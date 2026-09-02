# a Route Handler is found by export name; 405 means the name matched nothing
Lesson: there is no registration step for API methods. When a request reaches `src/app/api/x/route.ts`, Next.js looks at the module's exports and picks the one whose name equals the HTTP method — literally the string `GET`, `POST`, `PUT`, `PATCH`, `DELETE`. Uppercase, exact. Anything else exported is just a function nobody calls.
That gives 405 a precise meaning: the URL resolved to a route file (otherwise it would be 404), but no export named after this method exists. TypeScript will not complain — a lowercase or misspelled export is valid code, just invisible to the router.
The dev-server terminal prints the complaint with the file name; read that before reading code.
    curl -i localhost:3100/api/health     status line tells 404 (no route) from 405 (route, no method)
    grep -n 'export' src/app/api/health/route.ts    which names does this file actually export?
    npm run dev                           its terminal names the file and the complaint
Try it first: `curl -i -X DELETE localhost:3100/api/health` — 405 is the normal answer for a method the file never exported. Now compare with what GET returns.
Your task: monitoring hits `GET /api/health` on the shop and gets `405 Method Not Allowed` since the last deploy. The route file is there, nobody touched the monitoring. App: `~/.k8s-wargame/nextjs/app` — `npm run dev` (port 3100), `npm run build`, `npm test`.
Goal: `GET /api/health` returns 200 with `{"ok":true,…}`.
Check yourself:  wg check      stuck?  wg hint
