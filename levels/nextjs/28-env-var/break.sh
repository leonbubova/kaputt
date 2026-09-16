source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
sed -i '' '/SUPPORT_EMAIL/d; /server-only: shown on \/about/d' "$APP/.env.local"
cp "$TPL/src/app/about/page.tsx" "$APP/src/app/about/page.tsx"
perl -0pi -e 's/  const support = process.env.SUPPORT_EMAIL;\n//; s/      <p>\n        Support:.*?<\/p>\n//s' "$APP/src/app/about/page.tsx"
