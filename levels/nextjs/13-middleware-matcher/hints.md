## 1
Middleware runs before routing — but only for the paths its `config.matcher` selects. A path outside the matcher skips the middleware completely and falls through to normal routing, where nothing exists (hence 404). `curl -I localhost:3100/legacy` → 404 confirms the middleware never ran.
## 2
Open `src/middleware.ts`. The `matcher` decides which paths the middleware is invoked for at all — compare it with the paths in the ticket.
## 3
Set `matcher: ["/legacy", "/legacy/:path*"]` (or simply `["/legacy/:path*"]` plus `"/legacy"`). The dev server picks it up on save.
