# a folder is a web address
Lesson: under `src/app`, every folder is a web address (a URL). The folder `src/app/about` is the page
http://localhost:3100/about, and `src/app/dashboard` is /dashboard. What shows up there is the file `page.tsx`
inside that folder — the name must be exactly `page.tsx`. A folder without one is not a page, and an address
without a folder answers "404 — This page could not be found".
Try it:
    cd ~/.k8s-wargame/nextjs/app
    ls src/app
    ls src/app/about
Open http://localhost:3100/about and http://localhost:3100/hello in the browser — the second one is a 404.
Your task: make http://localhost:3100/hello exist. Create the folder `src/app/hello` and copy the about page into
it under the name `page.tsx` (it will still say "About" — the next lesson shows what is inside the file):
    mkdir src/app/hello
    cp src/app/about/page.tsx src/app/hello/page.tsx
Reload http://localhost:3100/hello — no 404 any more.
App: ~/.k8s-wargame/nextjs/app — `cd` there (or `wg shell`). Editor: any (VS Code: `code ~/.k8s-wargame/nextjs/app`). Keep `npm run dev` in one terminal, work in a second. Every level resets the app and stops the server: run `npm run dev` again after `wg next`.
Check yourself:  wg check      stuck?  wg hint
