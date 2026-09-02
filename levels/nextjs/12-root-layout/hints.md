## 1
Next.js sends exactly what your component tree returns — it does not wrap pages in a document for you. `<html>` and `<body>` have to come from somewhere in your own code. `curl -s localhost:3100/about | head -c 300` — the response starts with `<script>`/`<meta>` and never opens `<html>` or `<body>`.
## 2
In the App Router the **root layout** (`src/app/layout.tsx`) is responsible for rendering `<html>` and `<body>` itself — Next.js does not add them for you. A fragment `<>…</>` is not enough.
## 3
Wrap the layout's return value: `<html lang="de"><body>…</body></html>`.
