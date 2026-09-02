## 1
`curl -s localhost:3100/ | grep -o '<title>.*</title>'` — empty. Where does the title come from in the App Router? Look at `src/app/layout.tsx`.
## 2
Next.js only picks up metadata from exports with the exact names `metadata` or `generateMetadata`. Anything else is just an unused constant — TypeScript is happy, Next ignores it.
## 3
`src/app/layout.tsx`: rename `export const metaData` → `export const metadata`.
