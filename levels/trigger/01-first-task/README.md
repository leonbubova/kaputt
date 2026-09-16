# your first background task
Lesson: a background task is a piece of work your app hands off to be done later, outside the web request a
user is waiting on — sending a mail, building a report. Trigger.dev is a service that runs such tasks. In this
game nothing is sent anywhere: `wg check` runs your task code right here on your machine.
A task is a plain TypeScript file. Open `src/trigger/hello.ts` — it contains one:
    export const hello = task({
      id: "hello",
      run: async () => {
        return { message: "hello, world" };
      },
    });
`task({ … })` builds the task. `id` is its name (text in quotes, must be unique). `run` is the code that
executes when the task runs; whatever `run` returns is the result of that run.
Try it — in a terminal:
    cd ~/.k8s-wargame/trigger/app
    npx tsc --noEmit
Silence means the project type-checks: no mistakes found. Your loop on every level: edit, save, `npx tsc --noEmit`, `wg check`.
Your task: change the text so the run returns `{ message: "hello, trigger" }`. Save the file.
File: ~/.k8s-wargame/trigger/app/src/trigger/hello.ts — open it in any editor (VS Code: `code ~/.k8s-wargame/trigger/app`). `wg shell` puts your terminal into that folder.
Check yourself:  wg check      stuck?  wg hint
