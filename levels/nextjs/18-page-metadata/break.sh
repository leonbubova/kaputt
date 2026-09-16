source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
perl -0pi -e 's/export const metadata = \{ title: "Dashboard" \};\n\n//' "$APP/src/app/dashboard/page.tsx"
