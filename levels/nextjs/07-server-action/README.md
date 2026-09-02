# add a guestbook with a server action
"Build `/guestbook`: a form with an `<input name="name">` whose submit runs a **Server Action** that appends the name to an in-memory list and revalidates the page; below the form a `<ul data-testid="guestbook">` lists all names. No database, no client JS needed — a plain form POST must work."
App: `~/.k8s-wargame/nextjs/app`. Goal: `GET /guestbook` → 200 with the form bound to a Server Action; a form POST with `name=…` results in that name appearing in the list on the next GET.
