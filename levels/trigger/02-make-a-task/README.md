# make a task of your own
Lesson: every task lives in its own file under `src/trigger/`. That folder is where the Trigger.dev tool looks
for tasks (`trigger.config.ts` says so: `dirs: ["./src/trigger"]`) — a task file anywhere else is invisible.
A task file has three parts: import `task` from the SDK, build the task, and `export` it so it can be found:
    import { task } from "@trigger.dev/sdk";

    export const hello = task({
      id: "hello",
      run: async () => {
        return { message: "hello, trigger" };
      },
    });
The variable name (`hello`) is for your code; the `id` (`"hello"`) is for the platform. Both must be unique.
Try it — see which task files exist right now:
    ls ~/.k8s-wargame/trigger/app/src/trigger
Your task: create a new file `src/trigger/say-hi.ts` with a task whose `id` is `say-hi`, exported as `sayHi`,
whose `run` returns `{ hi: true }` (a boolean, no quotes).
File: ~/.k8s-wargame/trigger/app/src/trigger/say-hi.ts — a new file; create it in your editor. Then `npx tsc --noEmit` in ~/.k8s-wargame/trigger/app.
Check yourself:  wg check      stuck?  wg hint
