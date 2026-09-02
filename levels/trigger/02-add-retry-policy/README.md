# ticket: retry policy for the CRM sync
"The CRM API times out on the first calls after a cold start. `sync-crm` should retry up to **5 attempts** with exponential backoff starting at **2 s** and capped at **30 s**. The project default (3 attempts, 1 s) stays as it is for everyone else." Goal: exactly that, on the task.
