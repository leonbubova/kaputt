source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
clock() { sed -n 's/.*\(data-testid="clock">.*<\/p>\).*/\1/p' body | cut -d'<' -f1-12; }
dev_up; get /; want 200 "/"; body_has 'data-testid="clock"' "clock element removed"; a=$(clock); sleep 1.1; get /; b=$(clock)
[ "$a" = "$b" ] || fail "server markup differs between two requests → will not match the client:
  $a
  $b"
grep -q 'suppressHydrationWarning' src/components/Clock.tsx && fail "suppressHydrationWarning hides the warning, it doesn't fix the flicker — render the time on the client only"
ok "clock markup is deterministic"
