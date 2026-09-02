import { NextResponse, type NextRequest } from "next/server";

// old marketing links still point at /legacy — keep them working
export function middleware(req: NextRequest) {
  if (req.nextUrl.pathname.startsWith("/legacy")) {
    return NextResponse.redirect(new URL("/about", req.url), 308);
  }
  return NextResponse.next();
}

export const config = {
  matcher: ["/legacy/:path*", "/legacy"],
};
