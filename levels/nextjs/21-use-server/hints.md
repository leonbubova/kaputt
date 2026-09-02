## 1
Props from a Server Component to a Client Component are serialised — and a plain function can't be. The one function-shaped thing that may cross that boundary is a Server Action, which Next.js encodes as a reference. Read the error to the end: *…unless you explicitly expose it by marking it with "use server"*.
## 2
What turns a plain async function into a Server Action is the `"use server"` directive — at the top of the file (all exports) or as the first line inside the function.
## 3
Add `"use server";` as the first line of `src/app/cart/actions.ts`.
