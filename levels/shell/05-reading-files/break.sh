source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
words=(marmalade teapot lantern pebble walrus compass)
w=${words[$((RANDOM % ${#words[@]}))]}
wf letter.txt <<F
Dear new shell user,
welcome aboard. Everything you type here stays inside the sandbox, so nothing can go wrong.
One thing before you move on — the secret word is: $w
Keep it safe, you will need it in a moment.
F
i=1; : > "$WORK/long.txt"
while [ $i -le 300 ]; do echo "line $i of a long file — this is what less is for" >> "$WORK/long.txt"; i=$((i + 1)); done
chmod -x "$WORK/long.txt"
