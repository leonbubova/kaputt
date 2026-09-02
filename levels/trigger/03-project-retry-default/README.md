# ticket: retries for the whole project
"Right now a task that throws once just fails. Every task should get up to **3 attempts** with exponential backoff from **1 s** up to **10 s** — set once for the whole project, not copied into every task. Tasks that declare their own policy (`sync-crm`) keep it." Goal: exactly that project default.
