# add the gallery page with the CDN hero image
"`/gallery` is linked in the nav but 404s. It needs a heading `Gallery` and the hero image `https://cdn.wurm.example/worms/hero.jpg` (640×360, alt `Regenwurm`) — rendered through `next/image` so it gets optimised, not a plain `<img>`. The CDN host is already allowed in `next.config.ts`."
App: `~/.k8s-wargame/nextjs/app`. Goal: `GET /gallery` → 200 with the hero image served via `next/image`.
