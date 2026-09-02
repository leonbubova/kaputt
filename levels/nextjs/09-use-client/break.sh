source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
sed -i '' '/^"use client";$/d' "$APP/src/components/Counter.tsx"; sed -i '' '/./,$!d' "$APP/src/components/Counter.tsx"
