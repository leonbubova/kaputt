# curly braces: JavaScript inside JSX
Lesson: JSX looks like HTML, but inside it `{ … }` switches back to JavaScript. Whatever the code between the
braces produces is shown on the page. Put a value into a box first, then use it:
    export default function Hello() {
      const worms = 3;
      return <p>{worms} worms in stock</p>;
    }
shows `3 worms in stock`. Any expression works: `{worms * 2}`, `{"a" + "b"}`, `{worms > 2 ? "many" : "few"}`.
Without braces, `<p>worms</p>` shows the word worms, not the number. Lines before `return` are ordinary JavaScript.
Your task: in `src/app/hello/page.tsx` add `const worms = 3;` as the first line inside the function (before
`return`) and a third paragraph `<p>{worms * 2} worms</p>` below the existing two. The page shows `6 worms`.
App: ~/.k8s-wargame/nextjs/app — `cd` there (or `wg shell`). Editor: any (VS Code: `code ~/.k8s-wargame/nextjs/app`). Keep `npm run dev` in one terminal, work in a second. Every level resets the app and stops the server: run `npm run dev` again after `wg next`.
Check yourself:  wg check      stuck?  wg hint
