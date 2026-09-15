# CI build is red, app works locally
"`npm run dev` is fine, the product list renders. But `npm run build` fails in CI with a TypeScript error since the last commit to the product list component, so nothing can be deployed."
App: `~/.k8s-wargame/nextjs/app`. Goal: `npm run build` (and `npm run typecheck`) pass; `/products` still lists all products. Don't disable type checking.
