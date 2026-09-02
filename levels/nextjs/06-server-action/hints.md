## 1
Three pieces: a module holding the list (`src/lib/guestbook.ts`: `const entries: string[] = []`), a Server Action file (`src/app/guestbook/actions.ts`, first line `"use server";`, `export async function sign(formData: FormData)`), and the page `src/app/guestbook/page.tsx` rendering `<form action={sign}>` plus the list.
## 2
Inside the action: `const name = String(formData.get("name"))`, push it, then `revalidatePath("/guestbook")` from `next/cache` — otherwise the (cached) page keeps its old list. Pass the action to the form via `action={sign}`; Next.js wires the POST for you.
## 3
See `src/app/cart/actions.ts` + `src/components/AddForm.tsx` for the action/form shape. `curl -F name=leon -F '$ACTION_ID_<id>=' localhost:3100/guestbook` (id from the hidden input in the HTML) submits the form without a browser.
