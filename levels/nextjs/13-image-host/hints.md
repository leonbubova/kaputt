## 1
`curl -s localhost:3100/gallery` → 500. The dev-server terminal prints the full message: *Invalid src prop … hostname "…" is not configured under images in your next.config.js*.
## 2
`next/image` refuses remote hosts it does not know — an allow-list in `next.config.ts` under `images.remotePatterns`. Compare the hostname there with the one in the error.
## 3
Add/replace the entry: `{ protocol: "https", hostname: "cdn.wurm-assets.example" }`. `next.config.ts` is only read at startup — **restart `npm run dev`**.
