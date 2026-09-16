# the layout: the frame around every page
Lesson: the shop name and the menu at the top look the same on every page, yet no page contains them. They come
from `src/app/layout.tsx` — the layout. It is a component like a page, with one special prop: `children` is the
page currently being shown. The layout puts its own HTML around it:
    export default function RootLayout({ children }: { children: React.ReactNode }) {
      return (
        <html lang="de">
          <body>
            <header> …shop name and menu… </header>
            <main>{children}</main>
          </body>
        </html>
      );
    }
The menu entries are `<Link href="/about">About</Link>` — a link to a folder address from lesson 2. Change the
layout once and every page changes.
Try it: open `src/app/layout.tsx` and find the `<nav>` with the Link tags. Compare with the top of any page in the browser.
Your task: add a menu entry `<Link href="/hello">Hello</Link>` inside the `<nav>` of `src/app/layout.tsx`, right
after the About link. Afterwards every page — http://localhost:3100/, /about, /hello — shows the Hello link.
App: ~/.k8s-wargame/nextjs/app — `cd` there (or `wg shell`). Editor: any (VS Code: `code ~/.k8s-wargame/nextjs/app`). Keep `npm run dev` in one terminal, work in a second. Every level resets the app and stops the server: run `npm run dev` again after `wg next`.
Check yourself:  wg check      stuck?  wg hint
