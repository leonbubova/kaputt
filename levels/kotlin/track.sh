# track: Kotlin on the host — plain kotlinc + java, no Gradle. Play area: ~/.k8s-wargame/kotlin/app
KT_HOME=$HOME/.k8s-wargame/kotlin
KT_APP=$KT_HOME/app
KT_TPL=$WG_ROOT/levels/kotlin/template
KT_VER=2.1.20
KT_COR_VER=1.10.1
kt_java_ok() { command -v java >/dev/null 2>&1 || return 1; local v; v=$(java -version 2>&1 | awk -F'"' '/version/{print $2}' | cut -d. -f1); [ "${v:-0}" -ge 17 ]; }
kt_find_kotlinc() {   # prints the real path of a usable kotlinc (symlinks resolved, brew installs one), or nothing
  local kc; if [ -x "$KT_HOME/kotlinc/bin/kotlinc" ]; then kc="$KT_HOME/kotlinc/bin/kotlinc"; else kc=$(command -v kotlinc 2>/dev/null || true); fi
  [ -n "$kc" ] || return 0
  local n=0; while [ -L "$kc" ] && [ $n -lt 10 ]; do local t; t=$(readlink "$kc"); case "$t" in /*) kc=$t ;; *) kc=$(dirname "$kc")/$t ;; esac; n=$((n+1)); done
  echo "$kc"
}
track_start() {
  kt_java_ok || { echo "java >= 17 missing: brew install openjdk@17 / apt install openjdk-17-jdk" >&2; exit 1; }
  mkdir -p "$KT_HOME/lib"
  if [ -z "$(kt_find_kotlinc)" ]; then
    echo "downloading kotlin compiler ${KT_VER} into ${KT_HOME} (once, ~90 MB)…"
    command -v unzip >/dev/null 2>&1 || { echo "unzip missing" >&2; exit 1; }
    curl -fsSL -o "$KT_HOME/kotlinc.zip" "https://github.com/JetBrains/kotlin/releases/download/v${KT_VER}/kotlin-compiler-${KT_VER}.zip" || { echo "download failed" >&2; exit 1; }
    (cd "$KT_HOME" && rm -rf kotlinc && unzip -q kotlinc.zip && rm kotlinc.zip) || { echo "unzip failed" >&2; exit 1; }
  fi
  if [ ! -f "$KT_HOME/lib/kotlinx-coroutines-core-jvm.jar" ]; then
    echo "downloading kotlinx-coroutines ${KT_COR_VER} (once)…"
    curl -fsSL -o "$KT_HOME/lib/kotlinx-coroutines-core-jvm.jar" "https://repo1.maven.org/maven2/org/jetbrains/kotlinx/kotlinx-coroutines-core-jvm/${KT_COR_VER}/kotlinx-coroutines-core-jvm-${KT_COR_VER}.jar" || { echo "download failed" >&2; exit 1; }
  fi
  local kc; kc=$(kt_find_kotlinc); local kdir; kdir=$(cd "$(dirname "$kc")/.." && pwd)
  local stdlib="$kdir/lib/kotlin-stdlib.jar"; [ -f "$stdlib" ] || stdlib=$(ls "$kdir"/lib/kotlin-stdlib*.jar 2>/dev/null | head -1)
  [ -f "$stdlib" ] || { echo "kotlin-stdlib.jar not found next to ${kc}" >&2; exit 1; }
  printf '# written by wg start — sourced by the play area run.sh and by wg check\nexport WG_KOTLINC="%s"\nexport WG_KT_CP="%s:%s"\n' "$kc" "$stdlib" "$KT_HOME/lib/kotlinx-coroutines-core-jvm.jar" > "$KT_HOME/env.sh"
  track_wipe
  cat "$WG_ROOT/levels/kotlin/README.md"
}
track_stop() { rm -rf "$KT_APP"; echo "stopped (compiler kept in $KT_HOME)"; }
track_ready() { [ -f "$KT_HOME/env.sh" ] && [ -n "$(kt_find_kotlinc)" ] && [ -f "$KT_HOME/lib/kotlinx-coroutines-core-jvm.jar" ]; }
track_wipe() { rm -rf "$KT_APP"; cp -R "$KT_TPL" "$KT_APP"; chmod +x "$KT_APP/run.sh"; }
track_shell() { cd "$KT_APP" && exec "${SHELL:-bash}"; }
track_workdir() { echo "$KT_APP"; }
