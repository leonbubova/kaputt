## 1
`maxDuration` is in **seconds** and can be set project-wide (`trigger.config.ts`) or per task. Which one is 30?
## 2
`grep -rn maxDuration trigger.config.ts src/trigger`. The task-level value wins over the project value.
## 3
In `src/trigger/generate-report.ts` set `maxDuration: 1200` (20 min). Leave `trigger.config.ts` at 300.
