## 1
`next/image` exports an `Image` component that replaces `<img>`: it resizes and serves the picture through your own server (`/_next/image?url=…`). Remote hosts must be on the allow-list in `next.config.ts` — `cdn.wurm.example` already is.
## 2
`<Image>` needs `src`, `alt`, and — for remote URLs — explicit `width` and `height`, otherwise it refuses to render.
## 3
```tsx
import Image from "next/image";
export default function Gallery() { return <section><h1>Gallery</h1><Image src="https://cdn.wurm.example/worms/hero.jpg" alt="Regenwurm" width={640} height={360} /></section>; }
```
