## 1
Every run has a maximum duration. The project-wide value sits in `trigger.config.ts` (`maxDuration`); a task can override it with the same option next to its `id`. `grep -rn maxDuration trigger.config.ts src/trigger`.
## 2
`maxDuration` is in **seconds**. 10 minutes = 600.
## 3
In `src/trigger/import-csv.ts` add `maxDuration: 600,` next to `id`. Leave `trigger.config.ts` at 300.
