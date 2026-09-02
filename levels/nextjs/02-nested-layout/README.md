# layouts nest: a layout.tsx wraps every page below its folder
Lesson: a `layout.tsx` is a component that receives `{ children }` and renders around it. The root one in `src/app/` wraps the whole site. Put another `layout.tsx` inside a route folder and it wraps only that folder and everything beneath it — nested inside the root layout, not instead of it.
That is how shared UI stays in one place. A sub-navigation every `/dashboard/*` page needs belongs in `src/app/dashboard/layout.tsx`, written once; each `page.tsx` below renders only its own content and gets the nav for free. Copying the nav into every page works today and drifts tomorrow.
One rule: only the root layout renders `<html>` and `<body>` — a nested layout returns a plain wrapper element.
    src/app/<route>/layout.tsx        wraps <route> and all its children; receives { children }
    src/app/<route>/<sub>/page.tsx    a child route, rendered inside every layout above it
    import Link from "next/link"      client-side navigation between pages
    curl -s localhost:3100/dashboard | grep -o '<nav[^>]*>'   is the nav in the HTML?
Try it first: `cat src/app/layout.tsx` — see where `children` sits inside `<body>`. A nested layout does the same without the html/body shell.
Your task: `/dashboard` and a new `/dashboard/settings` page should share a sub-nav (`Overview` → `/dashboard`, `Settings` → `/dashboard/settings`) — rendered once, not copied into each page. Mark the nav `data-testid="dashboard-nav"`. App: `~/.k8s-wargame/nextjs/app`.
Goal: both URLs return 200 and contain the sub-nav; the nav lives in a nested layout, not in the pages.
Check yourself:  wg check      stuck?  wg hint
