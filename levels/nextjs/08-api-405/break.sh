source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
cat > "$APP/src/app/api/health/route.ts" <<'T'
import { NextResponse } from "next/server";

export async function get() {
  return NextResponse.json({ ok: true, service: "wurm-shop" });
}
T
