## 1
API endpoints in the App Router are *Route Handlers*: a file named `route.ts` (not `page.tsx`) in the folder that is the URL — `src/app/api/ping/route.ts`.
## 2
Export one function per HTTP method, named in uppercase: `export async function GET() { … }`. Return a `Response` — `NextResponse.json({...})` is the shortcut.
## 3
`mkdir -p src/app/api/ping && printf 'import { NextResponse } from "next/server";\nexport async function GET() { return NextResponse.json({ ok: true }); }\n' > src/app/api/ping/route.ts`
