source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
wd photos
for f in beach cat mountain; do echo "(pretend this is a photo of a $f)" | wf "$f.jpg"; done
wf notes.txt <<'F'
buy film for the camera
F
wf todo.txt <<'F'
sort the holiday photos
F
