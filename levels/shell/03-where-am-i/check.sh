source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
if ! have kitchen/i-was-here.txt; then
  have i-was-here.txt && fail "i-was-here.txt landed in the sandbox itself, not in kitchen — cd kitchen first, then create it"
  fail "no kitchen/i-was-here.txt yet — cd into the kitchen folder, then create the file there"
fi
ok "i-was-here.txt is in the kitchen — you moved into a folder and worked there"
