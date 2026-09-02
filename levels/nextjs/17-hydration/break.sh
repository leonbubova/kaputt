source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
cat > "$APP/src/components/Clock.tsx" <<'T'
"use client";

// shows when the page was rendered
export function Clock() {
  const now = new Date().toISOString();
  return <p data-testid="clock">Rendered at {now}</p>;
}
T
