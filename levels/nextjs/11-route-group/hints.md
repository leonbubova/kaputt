## 1
In the App Router the URL is the folder path — but not every folder counts. Some naming conventions exist only to organise files and add nothing to the URL, so "the files are still there" and "the route is gone" can both be true. `find src/app -name 'page.tsx'`. Which folder holds the products page — and what's special about its name?
## 2
Folders in parentheses, `(name)`, are *route groups*: they organise files but are **omitted from the URL**. `app/(products)/page.tsx` is therefore `/`, not `/products`, and `(products)/[slug]` became `/[slug]`.
## 3
`mv 'src/app/(products)' src/app/products` — a real URL segment needs a plain folder name.
