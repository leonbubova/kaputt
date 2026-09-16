# dashboard tab should say "Dashboard"
"Every page's browser tab reads `Wurm Shop`. For `/dashboard` the tab must read `Dashboard` — the rest of the site keeps its title. Don't touch the root layout."
App: `~/.k8s-wargame/nextjs/app`. Goal: `GET /dashboard` contains `<title>Dashboard</title>`; `GET /` still `<title>Wurm Shop</title>`.
