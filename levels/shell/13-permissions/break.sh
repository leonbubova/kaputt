source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
wf hello.sh <<F
#!/bin/bash
# hello.sh — my first script: a text file full of commands, run top to bottom
echo "hello from your first script!"
echo "it ran" > "$WORK/it-ran.txt"
echo "(I left a note in it-ran.txt)"
F
rm -f "$WORK/it-ran.txt"
