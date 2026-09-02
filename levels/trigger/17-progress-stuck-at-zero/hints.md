## 1
The dashboard cannot see local variables. Only what goes through `metadata.set()` / `metadata.increment()` leaves the process.
## 2
`cat src/trigger/import-csv.ts` — `metadata.set` is called once, before the loop, with zeros. Inside the loop only a local object changes.
## 3
Inside the loop: `metadata.set("rows", done).set("progress", Math.round((done / payload.rows) * 100));`
