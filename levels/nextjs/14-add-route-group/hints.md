## 1
A folder whose name is in parentheses, `(legal)`, is a *route group*: it organises files (and can hold a shared `layout.tsx`) but adds nothing to the URL. `src/app/(legal)/imprint/page.tsx` is `/imprint`.
## 2
Everything else is a normal route: the folder `imprint` is the URL segment, the file must be `page.tsx` with a default export. Quote the parentheses in the shell.
## 3
`mkdir -p 'src/app/(legal)/imprint' && printf 'export default function Imprint() {\n  return <section><h1>Imprint</h1><p>Wurm Shop GmbH</p></section>;\n}\n' > 'src/app/(legal)/imprint/page.tsx'`
