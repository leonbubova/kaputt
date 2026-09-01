# machine-applied solutions, one function per level — used by run-all.sh only
WGGIT=${WG_GIT_DIR:-$HOME/.k8s-wargame/git}; R="git -C $WGGIT/repo"
export GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_NOSYSTEM=1 GIT_EDITOR=true
export GIT_AUTHOR_NAME=wg GIT_AUTHOR_EMAIL=wg@example.com GIT_COMMITTER_NAME=wg GIT_COMMITTER_EMAIL=wg@example.com
s01(){ $R commit --amend -m "Add login endpoint"; }
s02(){ $R rm --cached .env && $R commit --amend --no-edit; }
s03(){ $R branch feature/search && $R reset --hard origin/main; }
s04(){ $R switch -c hotfix/timeout; }
s05(){ printf 'app: shop\nretries: 5\ntimeout: 30\n' > "$WGGIT/repo/config.yaml"; $R add config.yaml && $R commit --no-edit; }
s06(){ $R reset --hard HEAD@{1}; }
s07(){ $R switch feature/payments && $R rebase main; }
s08(){ $R switch feature/avatar && $R reset --soft main && $R commit -m "Add user avatar URL"; }
s09(){ $R switch main && $R cherry-pick "$($R log --format=%H -1 --grep='null check' release/1.2)"; }
s10(){ local c; c=$($R fsck --unreachable 2>/dev/null | awk '/commit/{print $3}' | while read -r x; do $R cat-file -p "$x" | grep -q '^parent' && echo "$x"; done | head -1); $R stash apply "$c"; }
s11(){ $R remote set-url origin "$WGGIT/origin.git" && $R push; }
s12(){ $R pull --rebase && $R push; }
s13(){ $R bisect start HEAD "$($R rev-list --max-parents=0 HEAD)" >/dev/null && $R bisect run ./test.sh >/dev/null && $R rev-parse refs/bisect/bad > "$WGGIT/answer" && $R bisect reset; }
s14(){ $R rm --cached build/out.log && $R commit -m "Stop tracking build output"; }
s15(){ $R branch feature/export "$($R reflog --format=%H -n 20 | while read -r x; do [ "$($R log -1 --format=%s "$x")" = "Test CSV export" ] && echo "$x" && break; done)"; }
s16(){ $R log -S'MAX_RETRIES = 0' --format=%an -- worker.py > "$WGGIT/answer"; }
