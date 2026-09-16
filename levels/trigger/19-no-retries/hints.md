## 1
Retries are configured per project in `trigger.config.ts` (`retries.default`) and can be overridden per task. Which one applies to `sync-crm`?
## 2
A task-level `retry` block replaces the default entirely. `cat src/trigger/sync-crm.ts`.
## 3
Set `maxAttempts` back to 5 (or at least 3) in `sync-crm.ts`.
