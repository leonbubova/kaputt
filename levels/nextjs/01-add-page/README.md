# a URL is a folder under src/app, and page.tsx is what it renders
Lesson: the App Router has no route table. The file system is the router: every folder under `src/app/` is one URL segment, and the folder becomes a real page the moment it contains a file named exactly `page.tsx` that `export default`s a React component. `src/app/dashboard/page.tsx` is `/dashboard`; `src/app/page.tsx` is `/`.
Nothing else in the folder is a route. A `Hero.tsx` or `about.tsx` next to it is just a module you can import. Get the filename wrong and Next.js silently serves 404 — there is no error, because as far as it knows you never asked for that URL.
The component itself is plain JSX: a function returning markup. It renders on the server, and the root layout (`src/app/layout.tsx`) wraps it with the shop's chrome automatically.
    src/app/<route>/page.tsx          URL = folder; must have a default export
    npm run dev                       serves on http://localhost:3100
    curl -s localhost:3100/about | head   what the server actually rendered
    ls src/app                        the current route tree
Try it first: `cat src/app/dashboard/page.tsx` — that is the whole shape of a page. Then `curl -I localhost:3100/nope` and look at the status.
Your task: the nav already links to `/about` but it 404s. Marketing wants a simple page there: a heading `About` and one sentence. App: `~/.k8s-wargame/nextjs/app` — `npm run dev` (port 3100), `npm run build`, `npm test`.
Goal: `GET /about` returns 200 with an `<h1>About</h1>`.
Check yourself:  wg check      stuck?  wg hint
