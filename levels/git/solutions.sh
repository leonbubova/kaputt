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
s08(){ $R rm -q --cached coverage.xml && $R commit -q -m "Stop tracking coverage report"; }
s09(){ $R rm --cached .env && $R commit --amend --no-edit; }
s10(){ $R branch feature/search && $R reset --hard origin/main; }
s11(){ $R switch -c hotfix/timeout; }
s12(){ $R switch -q main && $R merge -q --no-edit feature/i18n; }
s13(){ printf 'app: shop\nretries: 5\ntimeout: 30\n' > "$WGGIT/repo/config.yaml"; $R add config.yaml && $R commit --no-edit; }
s14(){ $R reset --hard HEAD@{1}; }
s15(){ $R switch feature/payments && $R rebase main; }
s16(){ $R reset -q --soft HEAD~1; }
s17(){ $R switch feature/avatar && $R reset --soft main && $R commit -m "Add user avatar URL"; }
s18(){ $R switch main && $R cherry-pick "$($R log --format=%H -1 --grep='null check' release/1.2)"; }
s19(){ $R stash -q && $R switch -q main && echo 1.4.1 > "$WGGIT/repo/VERSION" && $R commit -q -am "Bump version to 1.4.1" && $R switch -q feature/report && $R stash pop -q; }
s20(){ local c; c=$($R fsck --unreachable 2>/dev/null | awk '/commit/{print $3}' | while read -r x; do $R cat-file -p "$x" | grep -q '^parent' && echo "$x"; done | head -1); $R stash apply "$c"; }
s21(){ $R remote set-url origin "$WGGIT/origin.git" && $R push; }
s22(){ $R pull -q; }
s23(){ $R pull --rebase && $R push; }
s24(){ $R bisect start HEAD "$($R rev-list --max-parents=0 HEAD)" >/dev/null && $R bisect run ./test.sh >/dev/null && $R rev-parse refs/bisect/bad > "$WGGIT/answer" && $R bisect reset; }
s25(){ $R rm --cached build/out.log && $R commit -m "Stop tracking build output"; }
s26(){ $R branch feature/export "$($R reflog --format=%H -n 20 | while read -r x; do [ "$($R log -1 --format=%s "$x")" = "Test CSV export" ] && echo "$x" && break; done)"; }
s27(){ echo "Priya Nair" > "$WGGIT/answer"; }
s28(){ $R log -S'MAX_RETRIES = 0' --format=%an -- worker.py > "$WGGIT/answer"; }
