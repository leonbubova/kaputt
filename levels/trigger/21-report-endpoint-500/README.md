# POST /api/reports returns 500
"Requesting a report from the app fails with `triggerAndWait can only be used from inside a task.run()`. The endpoint is supposed to kick off `generate-report` and return the run id so the UI can poll." Goal: `requestReport("2026-08")` returns `{ runId }` of a `generate-report` run with payload `{ month: "2026-08" }`.
