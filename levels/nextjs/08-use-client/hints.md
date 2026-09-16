## 1
Two files: a new `src/components/WormCounter.tsx` (first line `"use client";`, then the useState component) and one import + one tag in `src/app/hello/page.tsx`. `src/components/Counter.tsx` is the working example to copy from.
## 2
`const [count, setCount] = useState(0);` then `<p data-testid="worm-count">{count}</p>` and `<button onClick={() => setCount(count + 1)}>+1 worm</button>` — both inside one outer `<div>`. In the page: `import { WormCounter } from "@/components/WormCounter";` and `<WormCounter />` in the section.
## 3
```tsx
// src/components/WormCounter.tsx
"use client";
import { useState } from "react";
export function WormCounter() {
  const [count, setCount] = useState(0);
  return (
    <div>
      <p data-testid="worm-count">{count}</p>
      <button onClick={() => setCount(count + 1)}>+1 worm</button>
    </div>
  );
}
// src/app/hello/page.tsx: import { WormCounter } from "@/components/WormCounter"; and <WormCounter /> in the section
```
