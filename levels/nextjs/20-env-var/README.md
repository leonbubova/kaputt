# show the support address on /about
"`/about` should show a support link `<a data-testid="support">help@wurm.example</a>`. The address differs per environment (staging uses another one), so it must come from a variable `SUPPORT_EMAIL` in `.env.local` — never hard-coded in the page."
App: `~/.k8s-wargame/nextjs/app`. Goal: `GET /about` renders the link with `help@wurm.example`; the address appears in `.env.local`, not in `src/`.
