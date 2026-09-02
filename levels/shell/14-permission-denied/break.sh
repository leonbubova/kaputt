source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
wf notes/monday.txt <<'F'
monday: learned what a prompt is
F
wf notes/tuesday.txt <<'F'
tuesday: moved files around without fear
F
wf notes/wednesday.txt <<'F'
wednesday: ran my first script
F
wf backup.sh <<F
#!/bin/bash
# backup.sh — copies every note into the backup folder
mkdir -p "$WORK/backup"
cp "$WORK"/notes/*.txt "$WORK/backup/"
echo "backup done:"
ls "$WORK/backup"
F
rm -rf "$WORK/backup"
