## 1
`triggerAndWait` blocks a *parent run* until the child finishes — it needs a run to block. An HTTP handler is not a run.
## 2
From backend code you can only `trigger()` (fire-and-forget, returns a handle). Waiting happens client-side by polling / Realtime with the run id.
## 3
`const handle = await generateReport.trigger({ month }); return { runId: handle.id };`
