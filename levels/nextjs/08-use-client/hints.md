## 1
`curl -s localhost:3100/dashboard | head` — then read the dev-server terminal. The error names the file and the hook.
## 2
In the App Router every component is a Server Component unless the file says otherwise. Hooks like `useState`/`useEffect`/`onClick` need a Client Component.
## 3
Add `"use client";` as the very first line of `src/components/Counter.tsx`.
