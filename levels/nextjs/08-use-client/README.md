# a render crash on the server usually means browser code lost its "use client" boundary
Lesson: the red overlay is not a build error, it is a runtime crash while rendering a request. In the App Router the most common one is a component that reaches for the browser — `useState`, `useEffect`, an `onClick` — while being executed as a Server Component. The server has no state or events, so React throws, and every page that renders that component goes down with it.
The rule "server by default" has a consequence: the `"use client"` directive is what makes a file a Client Component, and nothing else. Remove that one line and the file's code is unchanged but its meaning flips.
The error message is specific: it names the hook, the component and the file. Read it from the dev-server terminal (or the overlay) instead of guessing.
    curl -s localhost:3100/dashboard | head       500 plus the error text
    grep -rn 'useState\|useEffect\|onClick' src/components    files that need the client boundary
    head -1 src/components/*.tsx                  which of them declare it
    "use client";                                  must be the very first line, above imports
Try it first: `head -3 src/components/AddForm.tsx` — a component that has the directive, and what it needs it for.
Your task: `/dashboard` shows the red Next.js error overlay since the counter widget was 'cleaned up'. Every other page works. App: `~/.k8s-wargame/nextjs/app`.
Goal: `GET /dashboard` renders 200 with the counter widget (`data-testid="counter"`) still interactive.
Check yourself:  wg check      stuck?  wg hint
