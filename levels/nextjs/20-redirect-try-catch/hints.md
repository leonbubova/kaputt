## 1
The log says `Error: NEXT_REDIRECT` and it comes from your own `console.error` in the `catch`. So the thing that was caught *is* the redirect.
## 2
`redirect()` works by **throwing** a special error that Next.js handles further up. A `try/catch` around it swallows that error — the redirect never happens.
## 3
Move `redirect(target)` outside the `try` block (compute `target` inside, redirect after), or re-throw with `isRedirectError(err)` from `next/dist/client/components/redirect-error`.
