# stock page shows yesterday's numbers
"Warehouse updates `data/stock.json`, `/api/stock` returns the new values immediately, but `/stock` keeps showing the old count until the server is restarted. It must always be live."
App: `~/.k8s-wargame/nextjs/app`. Goal: change a number in `data/stock.json` → the next `GET /stock` shows it. Keep loading the data through `/api/stock` with `fetch`.
