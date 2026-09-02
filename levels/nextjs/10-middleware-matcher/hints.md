## 1
`curl -I localhost:3100/legacy` → 404, so the middleware never ran. Middleware code that never runs usually has a `config.matcher` that doesn't match.
## 2
Open `src/middleware.ts`. The `matcher` decides which paths the middleware is invoked for at all — compare it with the paths in the ticket.
## 3
Set `matcher: ["/legacy", "/legacy/:path*"]` (or simply `["/legacy/:path*"]` plus `"/legacy"`). The dev server picks it up on save.
