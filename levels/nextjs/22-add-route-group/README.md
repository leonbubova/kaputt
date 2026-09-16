# add /imprint inside a legal route group
"Legal needs `/imprint` (heading `Imprint`, one line of address). More legal pages will follow and share a layout, so keep them together in a folder `(legal)` under `src/app` — that folder name must not show up in the URL."
App: `~/.k8s-wargame/nextjs/app`. Goal: `GET /imprint` → 200 with `<h1>Imprint</h1>`; the page file lives under `src/app/(legal)/`, not `src/app/imprint/`.
