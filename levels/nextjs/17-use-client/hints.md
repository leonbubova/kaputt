## 1
A red overlay is a crash while rendering, and in the App Router the classic one is server/client confusion: code that only makes sense in the browser was executed on the server. `curl -s localhost:3100/dashboard | head` — then read the dev-server terminal. The error names the file and the hook.
## 2
In the App Router every component is a Server Component unless the file says otherwise. Hooks like `useState`/`useEffect`/`onClick` need a Client Component.
## 3
Add `"use client";` as the very first line of `src/components/Counter.tsx`.
