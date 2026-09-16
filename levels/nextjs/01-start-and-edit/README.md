# start the app and change one word
Lesson: a Next.js app is a folder of text files. One program, the dev server, reads those files and turns them into
web pages your browser can open. You edit a file, save it, and the page in the browser changes — no restart needed.
The app for this game is the folder ~/.k8s-wargame/nextjs/app. Its pages live under `src/app`.
Try it — in a terminal:
    cd ~/.k8s-wargame/nextjs/app
    npm run dev
It prints `Local: http://localhost:3100` — open that address in your browser. This terminal is now busy showing
the server's log: leave it running and open a SECOND terminal window for everything else. (Ctrl+C stops the server.)
Your task: open the file `~/.k8s-wargame/nextjs/app/src/app/page.tsx` in an editor. Find the line `<h1>Welcome</h1>`
and change the word to `Hello`, so it reads `<h1>Hello</h1>`. Save the file. Reload the browser: the heading changed.
App: ~/.k8s-wargame/nextjs/app — `cd` there (or `wg shell`). Editor: any (VS Code: `code ~/.k8s-wargame/nextjs/app`). Keep `npm run dev` in one terminal, work in a second. Every level resets the app and stops the server: run `npm run dev` again after `wg next`.
Check yourself:  wg check      stuck?  wg hint
