# a component: a function that returns HTML
Lesson: open `src/app/hello/page.tsx`. A page is a JavaScript function that returns what to show. The return value
looks like HTML written straight into the code — that is called JSX. The smallest possible page:
    export default function Hello() {
      return <h1>Hello</h1>;
    }
`function Hello()` names the piece (always a capital letter). `export default` tells Next.js "this is the page".
Two rules of JSX: the function returns exactly ONE outer element — to show several things, put them inside one
`<section>…</section>`. And when the JSX spans several lines, wrap it in round brackets:
    export default function Hello() {
      return (
        <section>
          <h1>Hello</h1>
        </section>
      );
    }
Your task: replace everything in `src/app/hello/page.tsx` with your own component: a `<section>` that holds
`<h1>Hello</h1>` and, below it, `<p>I wrote this myself.</p>`. Save, reload http://localhost:3100/hello.
App: ~/.k8s-wargame/nextjs/app — `cd` there (or `wg shell`). Editor: any (VS Code: `code ~/.k8s-wargame/nextjs/app`). Keep `npm run dev` in one terminal, work in a second. Every level resets the app and stops the server: run `npm run dev` again after `wg next`.
Check yourself:  wg check      stuck?  wg hint
