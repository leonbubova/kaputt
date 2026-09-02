# route.ts turns a folder into an API endpoint: one exported function per HTTP method
Lesson: pages return HTML. When a URL should return JSON (or anything that is not a page), the folder gets a `route.ts` instead of a `page.tsx`. Same rule for the URL — folder path = path — but a Route Handler exports functions named after HTTP methods: `GET`, `POST`, `PUT`, `DELETE`. Next.js calls the one matching the request.
Each function returns a web-standard `Response`. `NextResponse.json({...})` builds one with a JSON body and the right `Content-Type` header. Methods you do not export do not exist: Next.js answers them with `405 Method Not Allowed` on its own, which is exactly what a health probe wants — cheap, explicit, no accidental writes.
A folder holds either `page.tsx` or `route.ts`, never both at the same path.
    src/app/api/<x>/route.ts          endpoint at /api/<x>
    export async function GET() { return NextResponse.json({ ok: true }); }   the whole handler
    import { NextResponse } from "next/server"
    curl -i localhost:3100/api/ping   status line + headers + body
Try it first: `cat src/app/api/health/route.ts` and `curl -s localhost:3100/api/health` — one exported function, one JSON answer. Now `curl -i -X POST localhost:3100/api/health` and read the status.
Your task: the load balancer needs a cheap health probe: `GET /api/ping` → JSON `{"ok":true}` with status 200. Other methods may 405. App: `~/.k8s-wargame/nextjs/app`.
Goal: `curl localhost:3100/api/ping` prints `{"ok":true}`.
Check yourself:  wg check      stuck?  wg hint
