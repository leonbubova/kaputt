# CRM sync fails on the first timeout
"`sync-crm` fails with `CRM API timeout (ETIMEDOUT)` on the very first attempt and never retries — it used to retry 5 times." Goal: `sync-crm` retries again (attempt 3 succeeds). Don't touch the project-wide defaults.
