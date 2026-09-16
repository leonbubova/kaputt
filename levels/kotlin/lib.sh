# helpers for kotlin levels — source "$WG_ROOT/levels/kotlin/lib.sh"
source "$WG_ROOT/lib/common.sh"
KT_HOME=$HOME/.k8s-wargame/kotlin
APP=$KT_HOME/app
BUILD=$KT_HOME/build; mkdir -p "$BUILD"
[ -f "$KT_HOME/env.sh" ] && source "$KT_HOME/env.sh"
HERE=$(pwd); LEVEL=$(basename "$HERE")
# break helper: overlay this level's files/ onto the play area (whole-file replacement, no sed)
apply_files() { [ -d "$HERE/files" ] && cp -R "$HERE/files/." "$APP/src/"; return 0; }
rm_src() { for f in "$@"; do rm -f "$APP/src/$f"; done; }
# compile the player's src/ + this level's check.kt (+ shared Assert.kt) into one jar; prints errors and fails
kt_compile() {
  local out; rm -f "$BUILD/check.jar"
  out=$("$WG_KOTLINC" "$APP/src" "$WG_ROOT/levels/kotlin/harness/Assert.kt" "$HERE/check.kt" -cp "$WG_KT_CP" -d "$BUILD/check.jar" 2>&1 | grep -v 'JAVA_TOOL_OPTIONS\|jansi\|^warning:' || true)
  [ -f "$BUILD/check.jar" ] || { echo "$out" | grep -E 'error:' | sed "s#$APP/##" | head -8; fail "src/ does not compile (see ./run.sh)"; }
}
# run the check's entry point; its output is the verdict
kt_run() { java -Dwg.app="$APP" -cp "$BUILD/check.jar:$WG_KT_CP" WgCheck 2>&1 | grep -v 'JAVA_TOOL_OPTIONS'; return "${PIPESTATUS[0]}"; }
kt_check() { kt_compile; kt_run || fail "see above"; }
# guard: a source file must still contain a construct (the story forbids a shortcut)
must_contain() { grep -q -- "$2" "$APP/src/$1" || fail "$1 must still use $2"; }
must_not_contain() { grep -q -- "$2" "$APP/src/$1" && fail "$1 must not use $2"; return 0; }
