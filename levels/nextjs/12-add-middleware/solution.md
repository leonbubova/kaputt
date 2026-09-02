`src/middleware.ts`: `middleware()` returns `NextResponse.redirect(new URL("/about", req.url))`; `config.matcher = ["/legacy", "/legacy/:path*"]`.
