source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
for f in beach cat mountain; do
  have "photos/$f.jpg" || { have "$f.jpg" && fail "$f.jpg is still in the sandbox — mv *.jpg photos/ moves them all"; fail "photos/$f.jpg is missing"; }
done
for f in notes todo; do
  have "$f.txt" || fail "$f.txt left the sandbox — only the .jpg files should move (did you use * instead of *.jpg?)"
done
ok "all photos are in photos/, the notes stayed — one pattern, three files"
