# logger: leave a note in the run
Lesson: a task runs somewhere you cannot watch. To know what happened inside, the task writes log lines, and
the Trigger.dev dashboard shows them per run, with a level (info, warn, error) and a time. The SDK gives you
`logger` for that — import it next to `task`:
    import { task, logger } from "@trigger.dev/sdk";
    …
      run: async (payload: { name: string }) => {
        logger.info(`greeting ${payload.name}`);
        return { greeting: `hello, ${payload.name}` };
      },
`logger.info("text")` writes one line at level info. `logger.warn` and `logger.error` are the same with a
different level. A plain `console.log` also shows up, but without a level — use `logger`.
Try it — the type checker also catches a forgotten import:
    cd ~/.k8s-wargame/trigger/app
    npx tsc --noEmit
Your task: in `src/trigger/greet.ts`, before the `return`, log one info line with exactly the text
`greeting NAME` (NAME = the payload's `name`) — for `{ name: "Ada" }` the line is `greeting Ada`.
File: ~/.k8s-wargame/trigger/app/src/trigger/greet.ts — then `npx tsc --noEmit` in ~/.k8s-wargame/trigger/app.
Check yourself:  wg check      stuck?  wg hint
