source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
if ! have house/garden/plant.txt; then
  have house/kitchen/plant.txt && fail "plant.txt landed in kitchen — from kitchen, garden is at ../garden/plant.txt"
  have plant.txt && fail "plant.txt landed in the sandbox itself — it belongs in house/garden"
  fail "no house/garden/plant.txt yet"
fi
ok "plant.txt is in the garden — you addressed a folder you were not standing in"
