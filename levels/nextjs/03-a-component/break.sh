source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
rm -rf "$APP/src/app/hello"; cp -R "$(pwd)/files/." "$APP/src/"   # /hello = the copied about page from lesson 2
