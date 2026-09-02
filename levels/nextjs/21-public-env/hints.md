## 1
Server HTML has the name, browser doesn't → the value is only known on the server. Look at how `src/components/ShopName.tsx` gets it and where it's defined (`.env.local`).
## 2
`process.env.*` is inlined into the browser bundle **only** for variables whose name starts with `NEXT_PUBLIC_`. Everything else is `undefined` in the client — hence the hydration mismatch.
## 3
Rename the variable to `NEXT_PUBLIC_SHOP_NAME` in both `.env.local` and `ShopName.tsx`. Restart `npm run dev` after editing `.env.local`.
