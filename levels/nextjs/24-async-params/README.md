# build broken after the Next 15 upgrade: "Type 'Props' does not satisfy the constraint 'PageProps'"
"We bumped Next.js 14 → 15. Dev works, but the terminal logs *`params` should be awaited before using its properties* on every product page, and `npm run build` fails on `/products/[slug]`."
App: `~/.k8s-wargame/nextjs/app`. Goal: `npm run build` passes and `/products/regenwurm` renders the price with no `sync-dynamic-apis` warning.
