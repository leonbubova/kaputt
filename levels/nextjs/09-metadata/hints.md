## 1
In the App Router you don't write `<head>` by hand — Next.js assembles `<title>`, description etc. from a metadata export in layouts and pages. No title means Next isn't finding that export. `curl -s localhost:3100/ | grep -o '<title>.*</title>'` — empty. Look at `src/app/layout.tsx`.
## 2
Next.js only picks up metadata from exports with the exact names `metadata` or `generateMetadata`. Anything else is just an unused constant — TypeScript is happy, Next ignores it.
## 3
`src/app/layout.tsx`: rename `export const metaData` → `export const metadata`.
