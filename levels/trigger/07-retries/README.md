# retries: when run throws
Lesson: if the code in `run` throws an error, that attempt has failed. Because the task runs on the platform,
the platform can simply try again a little later — a *retry*. Many failures are temporary (a slow API, a
timeout), so a second attempt often succeeds. How many attempts a task may get is an option next to `id`:
    export const pingCrm = task({
      id: "ping-crm",
      retry: { maxAttempts: 4 },
      run: async () => { … },
    });
`maxAttempts: 4` means: the first try plus up to 3 retries. Without `retry`, the project's default applies.
The run counts as failed only when the last attempt has failed too.
Try it — the CRM in this project fails on purpose; read how:
    cat ~/.k8s-wargame/trigger/app/src/lib/crm.ts
Your task: `src/trigger/ping-crm.ts` calls that CRM and fails on its first attempts. Give the task
`retry: { maxAttempts: 4 }` so a run gets four attempts. Change nothing inside `run`.
File: ~/.k8s-wargame/trigger/app/src/trigger/ping-crm.ts — then `npx tsc --noEmit` in ~/.k8s-wargame/trigger/app.
Check yourself:  wg check      stuck?  wg hint
