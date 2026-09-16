## 1
Next.js loads `.env.local` into `process.env` when the dev server starts. A Server Component (any file without `"use client"`) can read `process.env.SUPPORT_EMAIL` directly during render.
## 2
Add the line `SUPPORT_EMAIL=help@wurm.example` to `.env.local`, then in `src/app/about/page.tsx` read it into a const and render `<a data-testid="support" href={\`mailto:${support}\`}>{support}</a>`. Env files are read once — restart `npm run dev`.
## 3
`echo 'SUPPORT_EMAIL=help@wurm.example' >> .env.local`, then in the page: `const support = process.env.SUPPORT_EMAIL;` and the `<a>` from hint 2.
