## 1
Server Components can't hold state or handle clicks. Anything with `useState`/`onClick` goes into its own file that starts with `"use client";` — then the server page just imports and renders it.
## 2
Model it on `src/components/Counter.tsx`. A Server Component may render a Client Component (not the other way round for server-only code).
## 3
```tsx
"use client";
import { useState } from "react";
export function LikeButton() { const [n, set] = useState(0); return <button data-testid="like-button" onClick={() => set(n + 1)}>likes: {n}</button>; }
```
then `<LikeButton />` in `src/app/products/[slug]/page.tsx`.
