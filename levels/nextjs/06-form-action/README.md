# add a newsletter signup form
"Marketing wants `/newsletter`: a form with `<input name="email">` whose submit runs a **Server Action** on the server. For now the action only logs `newsletter: <email>` to the server terminal — no database yet. A plain form POST must work, no client JS."
App: `~/.k8s-wargame/nextjs/app`. Goal: `GET /newsletter` → 200 with the form bound to a Server Action; submitting `email=…` prints `newsletter: …` in the `npm run dev` terminal.
