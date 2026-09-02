# nextjs — the commands & files you'll actually use
App: ~/.k8s-wargame/nextjs/app (`wg shell` puts you there). Next 15, App Router, TypeScript.

  npm run dev                        http://localhost:3100 — its terminal shows the real error with file + line
  npm run build  /  npm run typecheck   the production build type-checks; `next dev` does NOT
  curl -s localhost:3100/path | head    what the server actually rendered (-I for status / Location)
  src/app/<route>/page.tsx           URL = folder; a route needs exactly `page.tsx` with a default export
  src/app/<route>/layout.tsx         wraps every page below it; the root layout must render <html><body>
  src/app/api/<x>/route.ts           endpoint: `export async function GET() { return NextResponse.json({…}) }`
  [slug]  /  (group)                 dynamic segment / route group (not part of the URL); `params` is a Promise in Next 15 → `await params`
  "use client";                      first line of any file using useState / useEffect / onClick
  "use server";                      first line of a Server Action file (form action, or passed to a client component)
  NEXT_PUBLIC_*                      the only env vars that reach the browser; restart `npm run dev` after editing .env.local
  src/middleware.ts → config.matcher    decides which paths run the middleware at all

Mental model: every component is a Server Component until its file says "use client". Server-only code (fs, secrets, data loading) stays in server files; client components get the result as props. Server HTML and the first client render must match exactly — anything random or time-based moves into useEffect. `redirect()` throws on purpose, so never wrap it in try/catch. Read the dev-server terminal first; it names the file.
