# hydration error on the home page
"Every load of `/` logs *Hydration failed because the server rendered text didn't match the client* and the page flickers. Started when the 'Rendered at …' line was added. Product wants to keep showing the render time."
App: `~/.k8s-wargame/nextjs/app`. Goal: `/` renders without a hydration mismatch — the server HTML must be deterministic (two requests give identical markup for the clock) and the clock element stays.
