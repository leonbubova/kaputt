source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf calc.sh <<'F'
#!/bin/sh
# add two numbers
echo $(( $1 + $2 ))
F
wf test.sh <<'F'
#!/bin/sh
cd "$(dirname "$0")"
[ "$(sh ./calc.sh 2 3)" = 5 ] && { echo PASS; exit 0; }
echo FAIL; exit 1
F
chmod +x "$REPO/calc.sh" "$REPO/test.sh"
: > "$REPO/CHANGELOG.md"
cm "Initial project with smoke test"
i=1; while [ $i -le 20 ]; do
  echo "- change $i" >> "$REPO/CHANGELOG.md"
  case $i in
    4)  wf util.sh <<'F'
#!/bin/sh
echo "$1" | tr a-z A-Z
F
        cm "Add util.sh" ;;
    9)  printf '# shop-tools\n' > "$REPO/README.md"; cm "Add README" ;;
    13) wf calc.sh <<'F'
#!/bin/sh
# add two numbers (simplified)
echo $(( $1 - $2 ))
F
        cm "Simplify calc arithmetic"; rec bad "$(h HEAD)" ;;
    17) printf '# shop-tools\nSee CHANGELOG.\n' > "$REPO/README.md"; cm "Expand README" ;;
    *)  cm "Update changelog ($i)" ;;
  esac
  i=$((i+1))
done
