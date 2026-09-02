## 1
Read the error to the end: *…unless you explicitly expose it by marking it with "use server"*. A Server Component may only hand a function to a Client Component if that function is a Server Action.
## 2
What turns a plain async function into a Server Action is the `"use server"` directive — at the top of the file (all exports) or as the first line inside the function.
## 3
Add `"use server";` as the first line of `src/app/cart/actions.ts`.
