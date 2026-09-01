# shared by the git track's break.sh / check.sh — source after lib/common.sh
WGGIT=${WG_GIT_DIR:-$HOME/.k8s-wargame/git}
REPO=$WGGIT/repo            # the player's repo
ORIGIN=$WGGIT/origin.git    # bare "remote" (levels that push/pull)
EXPECT=$WGGIT/.expect       # hashes recorded by break.sh, compared by check.sh
ANSWER=$WGGIT/answer        # levels that ask for an answer
export GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_NOSYSTEM=1 GIT_PAGER=cat
export GIT_AUTHOR_NAME=wg GIT_AUTHOR_EMAIL=wg@example.com GIT_COMMITTER_NAME=wg GIT_COMMITTER_EMAIL=wg@example.com
WG_T=1767261600   # deterministic clock → stable hashes
tick() { WG_T=$((WG_T+60)); export GIT_AUTHOR_DATE="$WG_T +0000" GIT_COMMITTER_DATE="$WG_T +0000"; }; tick
g()  { git -C "$REPO" "$@"; }
og() { git -C "$ORIGIN" "$@"; }
new_repo()        { rm -rf "$REPO"; mkdir -p "$REPO"; git -C "$REPO" init -q -b main; : > "$EXPECT"; rm -f "$ANSWER"; }
new_remote_repo() { rm -rf "$REPO" "$ORIGIN"; git init -q --bare -b main "$ORIGIN"; git clone -q "$ORIGIN" "$REPO" 2>/dev/null; : > "$EXPECT"; rm -f "$ANSWER"; }
wf()  { mkdir -p "$(dirname "$REPO/$1")"; cat > "$REPO/$1"; }                     # wf path <<EOF
cm()  { tick; g add -A; g commit -q --author="${2:-wg} <${3:-wg@example.com}>" -m "$1"; }   # cm msg [author] [email]
rec() { echo "$1=$2" >> "$EXPECT"; }
exp() { sed -n "s/^$1=//p" "$EXPECT" | tail -1; }
h()   { g rev-parse --verify -q "$1" 2>/dev/null; }
tree(){ g rev-parse --verify -q "$1^{tree}" 2>/dev/null; }
need_repo()  { [ -d "$REPO/.git" ] || fail "repo missing at $REPO — wg reset"; }
clean_tree() { [ -z "$(g status --porcelain)" ]; }
on_branch()  { g symbolic-ref -q HEAD >/dev/null 2>&1; }
no_op_in_progress() { [ ! -e "$REPO/.git/MERGE_HEAD" ] && [ ! -e "$REPO/.git/rebase-merge" ] && [ ! -e "$REPO/.git/rebase-apply" ] && [ ! -e "$REPO/.git/CHERRY_PICK_HEAD" ] && [ ! -e "$REPO/.git/BISECT_START" ]; }
