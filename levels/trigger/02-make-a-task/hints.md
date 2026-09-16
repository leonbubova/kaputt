## 1
Copy the shape of `src/trigger/hello.ts` into a new file `src/trigger/say-hi.ts`. Change three things: the variable name, the `id`, and what `run` returns.
## 2
`export const sayHi = task({ id: "say-hi", run: async () => { return { hi: true }; } })` — and the `import { task } from "@trigger.dev/sdk";` line at the top, or tsc says `Cannot find name 'task'`.
## 3
```ts
import { task } from "@trigger.dev/sdk";

export const sayHi = task({
  id: "say-hi",
  run: async () => {
    return { hi: true };
  },
});
```
in `src/trigger/say-hi.ts`.
