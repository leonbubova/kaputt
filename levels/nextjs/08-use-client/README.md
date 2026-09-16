# "use client": a component that reacts in the browser
Lesson: a server component (lesson 7) produces its HTML once and is done — it cannot react to a click, because by
then it has finished running. Anything that changes while you look at it has to run in the browser. You mark such
a component with the line `"use client";` as the very first line of its file. Then it may use `useState`: a value
the component remembers, and when the value changes the component draws itself again.
    "use client";
    import { useState } from "react";
    export function Counter() {
      const [count, setCount] = useState(0);
      return <button onClick={() => setCount(count + 1)}>clicked {count} times</button>;
    }
`useState(0)` gives a pair: the current value (starts at 0) and a function that changes it. `onClick={…}` runs
the code on every click. Such components live in `src/components/` (that folder is not a web address) and are
exported with a plain `export`; a page brings one in with `import { Counter } from "@/components/Counter";`
and uses it as a tag: `<Counter />`. The page itself stays a server component — only the file that needs clicks gets `"use client"`.
Try it: open `src/components/Counter.tsx` — this component is on http://localhost:3100/dashboard. Click it.
Your task: create `src/components/WormCounter.tsx`: line 1 `"use client";`, a `useState(0)`, a
`<p data-testid="worm-count">{count}</p>` and a button `+1 worm` that adds one to count. Export it as `WormCounter`.
In `src/app/hello/page.tsx` import it and put `<WormCounter />` into the section. Click the button on /hello — the number goes up.
App: ~/.k8s-wargame/nextjs/app — `cd` there (or `wg shell`). Editor: any (VS Code: `code ~/.k8s-wargame/nextjs/app`). Keep `npm run dev` in one terminal, work in a second. Every level resets the app and stops the server: run `npm run dev` again after `wg next`.
Check yourself:  wg check      stuck?  wg hint
