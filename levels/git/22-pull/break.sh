source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_remote_repo
wf README.md <<'F'
# shop-api
F
cm "Initial project"
g push -q origin main 2>/dev/null
rm -rf "$WGGIT/.colleague"; git clone -q "$ORIGIN" "$WGGIT/.colleague" 2>/dev/null
tick; printf 'def metrics():\n    return REGISTRY.export()\n' > "$WGGIT/.colleague/metrics.py"
git -C "$WGGIT/.colleague" add -A; git -C "$WGGIT/.colleague" commit -q --author="Jonas Reiter <jonas@example.com>" -m "Add metrics endpoint"
git -C "$WGGIT/.colleague" push -q origin main 2>/dev/null
rec theirs "$(git -C "$WGGIT/.colleague" rev-parse HEAD)"; rm -rf "$WGGIT/.colleague"
