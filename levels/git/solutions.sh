# machine-applied solutions, one function per level — used by run-all.sh only
WGGIT=${WG_GIT_DIR:-$HOME/.k8s-wargame/git}; R="git -C $WGGIT/repo"
export GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_NOSYSTEM=1 GIT_EDITOR=true
export GIT_AUTHOR_NAME=wg GIT_AUTHOR_EMAIL=wg@example.com GIT_COMMITTER_NAME=wg GIT_COMMITTER_EMAIL=wg@example.com
s01(){ $R init -q -b main && $R add -A && $R commit -q -m "Initial project"; }
s02(){ $R add app.py && $R commit -q -m "Return explicit status code"; }
s03(){ $R switch -q -c feature/greeting && printf 'def greet():\n    return "hi"\n' > "$WGGIT/repo/greeting.py" && $R add greeting.py && $R commit -q -m "Add greeting" && $R switch -q main; }
s04(){ $R switch -q main && $R merge -q feature/greeting; }
s05(){ echo '*.log' > "$WGGIT/repo/.gitignore" && $R add .gitignore && $R commit -q -m "Ignore log files"; }
s06(){ $R remote add origin "$WGGIT/origin.git" && $R push -q -u origin main; }
s07(){ $R commit --amend -m "Add login endpoint"; }
s08(){ $R rm --cached .env && $R commit --amend --no-edit; }
s09(){ $R branch feature/search && $R reset --hard origin/main; }
s10(){ $R switch -c hotfix/timeout; }
s11(){ printf 'app: shop\nretries: 5\ntimeout: 30\n' > "$WGGIT/repo/config.yaml"; $R add config.yaml && $R commit --no-edit; }
s12(){ $R reset --hard HEAD@{1}; }
s13(){ $R switch feature/payments && $R rebase main; }
s14(){ $R switch feature/avatar && $R reset --soft main && $R commit -m "Add user avatar URL"; }
s15(){ $R switch main && $R cherry-pick "$($R log --format=%H -1 --grep='null check' release/1.2)"; }
s16(){ local c; c=$($R fsck --unreachable 2>/dev/null | awk '/commit/{print $3}' | while read -r x; do $R cat-file -p "$x" | grep -q '^parent' && echo "$x"; done | head -1); $R stash apply "$c"; }
s17(){ $R remote set-url origin "$WGGIT/origin.git" && $R push; }
s18(){ $R pull --rebase && $R push; }
s19(){ $R bisect start HEAD "$($R rev-list --max-parents=0 HEAD)" >/dev/null && $R bisect run ./test.sh >/dev/null && $R rev-parse refs/bisect/bad > "$WGGIT/answer" && $R bisect reset; }
s20(){ $R rm --cached build/out.log && $R commit -m "Stop tracking build output"; }
s21(){ $R branch feature/export "$($R reflog --format=%H -n 20 | while read -r x; do [ "$($R log -1 --format=%s "$x")" = "Test CSV export" ] && echo "$x" && break; done)"; }
s22(){ $R log -S'MAX_RETRIES = 0' --format=%an -- worker.py > "$WGGIT/answer"; }
