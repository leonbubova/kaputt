source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
rm -rf "$APP/src/app/hello" "$APP/src/components/WormCounter.tsx"; cp -R "$(pwd)/files/." "$APP/src/"   # /hello + layout from lesson 7
