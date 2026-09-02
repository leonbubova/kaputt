source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
have hello.sh || fail "hello.sh is gone — wg reset"
if ! [ -x "$WORK/hello.sh" ]; then
  have it-ran.txt && fail "it ran, but hello.sh is still not executable — the task is chmod +x hello.sh, then ./hello.sh"
  fail "hello.sh is not executable yet — chmod +x hello.sh (look at ls -l hello.sh before and after)"
fi
have it-ran.txt || fail "hello.sh is executable, but it has not been run — ./hello.sh"
ok "hello.sh is executable and ran — you have run your first script"
