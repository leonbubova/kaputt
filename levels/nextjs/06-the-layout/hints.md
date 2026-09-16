## 1
Whatever is written in `src/app/layout.tsx` outside `{children}` appears on every page. The menu is the `<nav>…</nav>` block in there.
## 2
Copy the About entry and change both the address and the text: `<Link href="/hello">Hello</Link>`. Put it inside the `<nav>`, after `<Link href="/about">About</Link>`.
## 3
In `src/app/layout.tsx`, inside `<nav>`:
```tsx
<Link href="/about">About</Link> <Link href="/hello">Hello</Link>
```
