## 1
Layouts nest: `src/app/layout.tsx` wraps everything; a `layout.tsx` inside `src/app/dashboard/` wraps only `/dashboard` and its children. It receives `{ children }` like the root one.
## 2
A nested layout must **not** render `<html>`/`<body>` — just a wrapper with the nav and `{children}`. Then add the second route: `src/app/dashboard/settings/page.tsx`.
## 3
```tsx
// src/app/dashboard/layout.tsx
import Link from "next/link";
export default function DashboardLayout({ children }: { children: React.ReactNode }) {
  return <div><nav data-testid="dashboard-nav"><Link href="/dashboard">Overview</Link> <Link href="/dashboard/settings">Settings</Link></nav>{children}</div>;
}
```
