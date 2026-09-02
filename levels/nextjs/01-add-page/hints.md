## 1
In the App Router the URL is the folder structure under `src/app/`. `/about` ⇒ `src/app/about/`. Look at `src/app/dashboard/page.tsx` for the shape of a page.
## 2
The file must be called exactly `page.tsx` and `export default` a React component. Any other filename in that folder is not a route.
## 3
`mkdir -p src/app/about && printf 'export default function About() {\n  return <section><h1>About</h1><p>Wurm Shop, seit 2026.</p></section>;\n}\n' > src/app/about/page.tsx`
