# Shopify rate-limits us
"Since Friday `sync-shopify` runs fail with `429 Too Many Requests`. We have a `shopify-api` queue limited to 2 concurrent runs exactly for this, and the dashboard shows dozens of `sync-shopify` runs executing at once." Goal: `sync-shopify` runs at most 2 at a time.
