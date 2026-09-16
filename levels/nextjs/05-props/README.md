# props: giving a component inputs
Lesson: a component is a function, so it can take inputs — React calls them props. You write them like HTML
attributes where you use the component, and receive them as one object inside the function:
    function Greeting({ name }: { name: string }) {
      return <p>hello, {name}</p>;
    }
`{ name }` picks the prop called name out of that object. The part `: { name: string }` tells TypeScript that
name is text — copy it as it is. Use the component like a tag: `<Greeting name="Ada" />` shows `hello, Ada`.
A component without `export default` is a helper, not a page: define it in the same file, above the page
function, and use it as often as you like — each use with its own props.
Your task: in `src/app/hello/page.tsx` add the `Greeting` component above the page function, and use it twice
inside the section: `<Greeting name="Ada" />` and `<Greeting name="Linus" />`. The page shows `hello, Ada` and `hello, Linus`.
App: ~/.k8s-wargame/nextjs/app — `cd` there (or `wg shell`). Editor: any (VS Code: `code ~/.k8s-wargame/nextjs/app`). Keep `npm run dev` in one terminal, work in a second. Every level resets the app and stops the server: run `npm run dev` again after `wg next`.
Check yourself:  wg check      stuck?  wg hint
