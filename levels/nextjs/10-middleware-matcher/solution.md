`config.matcher` was changed to `/legacy-links/:path*`, so the middleware is skipped for `/legacy`.
    # src/middleware.ts
    export const config = { matcher: ["/legacy/:path*", "/legacy"] };
