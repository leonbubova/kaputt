# payload: the input a run gets
Lesson: a task usually needs data to work on — which user, which order. That data is the *payload*. It is
handed to `run` as its first parameter, and you declare its shape right there:
    run: async (payload: { name: string }) => {
      return { greeting: `hello, ${payload.name}` };
    },
`payload: { name: string }` says: the payload is an object with one field `name`, holding text. Inside `run`
you read it as `payload.name`. The backticks make a template string: `${…}` inserts a value into the text.
Each run gets its own payload — the same task, run twice with `{ name: "Ada" }` and `{ name: "Bo" }`, greets two people.
Try it — read the task that already uses a payload:
    cat ~/.k8s-wargame/trigger/app/src/trigger/process-order.ts
Your task: `src/trigger/greet.ts` ignores its input. Give `run` a payload `{ name: string }` and return
`{ greeting: "hello, NAME" }` where NAME is the payload's `name` — so `{ name: "Ada" }` gives `hello, Ada`.
File: ~/.k8s-wargame/trigger/app/src/trigger/greet.ts — then `npx tsc --noEmit` in ~/.k8s-wargame/trigger/app.
Check yourself:  wg check      stuck?  wg hint
