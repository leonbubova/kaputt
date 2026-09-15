## 1
The CLI only looks where `trigger.config.ts` tells it to. Compare the `dirs` entry with where the task files actually live (`ls src`).
## 2
Every path in `dirs` must exist and contain the task files. `./src/jobs` does not exist — the tasks are in `./src/trigger`.
## 3
Set `dirs: ["./src/trigger"]` (or drop `dirs` entirely — the CLI auto-detects directories named `trigger`).
