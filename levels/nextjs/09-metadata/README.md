# <head> is generated from a metadata export with an exact, conventional name
Lesson: in the App Router you never write `<head>` yourself. A layout or page exports a `metadata` object (or a `generateMetadata` function for dynamic values), and Next.js assembles `<title>`, `<meta name="description">`, Open Graph tags and more from it. The root layout's metadata applies to every page unless a page overrides a field.
The catch is that this is a naming convention, not an API you call. Next.js scans the module for exports called exactly `metadata` / `generateMetadata`. The framework's contract with a file is the export name. A differently named export is perfectly valid TypeScript — it compiles, it builds, it does nothing.
So "no error but the feature vanished" is the signature of a broken convention. Check the exact names against the docs, not the logic.
    export const metadata: Metadata = { title: "...", description: "..." }   in a layout or page
    curl -s localhost:3100/ | grep -o '<title>.*</title>'   what the served <head> contains
    grep -n 'export' src/app/layout.tsx           the exports Next.js sees
    import type { Metadata } from "next"
Try it first: `curl -s localhost:3100/ | grep -o '<meta name="description"[^>]*>'` — empty too? Then the whole metadata object is missing, not one field.
Your task: since yesterday the shop's tab just says `localhost:3100`. SEO complains the `<title>` and description are gone from every page. No build error, nothing in the logs. App: `~/.k8s-wargame/nextjs/app`.
Goal: `GET /` contains `<title>Wurm Shop</title>`.
Check yourself:  wg check      stuck?  wg hint
