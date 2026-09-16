## 1
A Server Action is an `async` function that runs on the server; hand it to `<form action={…}>` and Next.js turns the plain form POST into a call of that function. Two files: `src/app/newsletter/actions.ts` holding the action, `src/app/newsletter/page.tsx` rendering the form.
## 2
The action file starts with `"use server";` and exports `async function subscribe(formData: FormData)`. Read the field with `formData.get("email")` and `console.log` it. The page (a Server Component) imports it and renders `<form action={subscribe}>`.
## 3
```ts
// src/app/newsletter/actions.ts
"use server";
export async function subscribe(formData: FormData) { console.log("newsletter:", String(formData.get("email") ?? "")); }
```
then in `page.tsx`: `<form action={subscribe}><input name="email" /><button type="submit">subscribe</button></form>`.
