# a Server Action is a server function a form can call directly
Lesson: a form that submits data used to need an API route plus fetch code in the browser. A Server Action collapses that: an `async` function in a file starting with `"use server";`, handed to `<form action={fn}>`. Next.js renders the form with a hidden action id, and a plain HTML POST — no client JavaScript — invokes that function on the server with the `FormData`.
The action has two jobs. Read the fields: `formData.get("name")`. And tell Next.js the page changed: `revalidatePath("/guestbook")` from `next/cache`.
Keep the data in a module-level array in `src/lib/`: the server process lives across requests, so it is a tiny in-memory store.
    "use server";                     first line of the actions file
    export async function sign(formData: FormData) { ... }   the action
    revalidatePath("/guestbook")      from "next/cache"
    <form action={sign}>              binds the POST to the action
Try it first: `cat src/app/cart/actions.ts src/components/AddForm.tsx` — this app's existing action and the form calling it.
Your task: build `/guestbook`: a form with an `<input name="name">` whose submit runs a Server Action that appends the name to an in-memory list and revalidates the page; below the form a `<ul data-testid="guestbook">` lists all names. No database, no client JS needed — a plain form POST must work. App: `~/.k8s-wargame/nextjs/app`.
Goal: `GET /guestbook` → 200 with the form bound to a Server Action; a form POST with `name=…` results in that name appearing in the list on the next GET.
Check yourself:  wg check      stuck?  wg hint
