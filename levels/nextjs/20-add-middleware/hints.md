## 1
Middleware is one file, `src/middleware.ts` (next to `app/`), exporting a function `middleware(req: NextRequest)` that runs before routing and can answer with a redirect. `config.matcher` lists the paths it runs for.
## 2
Return `NextResponse.redirect(new URL("/about", req.url), 308)` from the function. The matcher needs both the bare path and its children: `matcher: ["/legacy", "/legacy/:path*"]`. Restart `npm run dev` after creating the file.
## 3
```ts
import { NextResponse, type NextRequest } from "next/server";
export function middleware(req: NextRequest) { return NextResponse.redirect(new URL("/about", req.url), 308); }
export const config = { matcher: ["/legacy", "/legacy/:path*"] };
```
