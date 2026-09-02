source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
perl -0pi -e 's#<html lang="de">\n\s*<body>\n#<>\n#; s#\n\s*</body>\n\s*</html>#\n    </>#' "$APP/src/app/layout.tsx"
