# the CLI only indexes tasks where trigger.config.ts tells it to look
Lesson: exporting a task from a file is not enough — the file also has to be found. The CLI does not scan the whole repo; it reads `dirs` from `trigger.config.ts` and walks only those directories. A task in a directory that is not listed does not exist as far as the platform is concerned: no dashboard entry, no runs, no error either.
"No tasks found" therefore says nothing about your task code. It says: the set of directories the CLI walked contained no task files. Either `dirs` points somewhere wrong, or the files moved and the config did not follow.
The mental model: two sources of truth that must agree — what the config declares and what the filesystem holds. When they drift, the platform trusts the config.
    cat trigger.config.ts          where does dirs point?
    ls src                         where do the task files actually live?
    ls src/trigger | wc -l         how many task files there are
    npx tsc --noEmit               compiles fine — tsc does not read dirs, the CLI does
Try it first: compare the `dirs` line with `ls src` side by side.
Your task: "Since the repo restructure `npx trigger.dev dev` prints `No tasks found` and the dashboard lists zero tasks. The task files are all there in git." Goal: the CLI indexes all 14 tasks of the project (`send-welcome-email`, `charge-card`, …). Don't rename task ids.
Check yourself:  wg check      stuck?  wg hint
