#!/usr/bin/env bash
# compile src/ into build/app.jar and run main() — ./run.sh [args]
cd "$(dirname "$0")" || exit 1
source ../env.sh || { echo "env.sh missing — wg start" >&2; exit 1; }
mkdir -p build; rm -f build/app.jar
"$WG_KOTLINC" src -cp "$WG_KT_CP" -d build/app.jar 2>&1 | grep -v 'JAVA_TOOL_OPTIONS\|jansi\|^warning:'
[ -f build/app.jar ] || { echo "compile failed" >&2; exit 1; }
java -cp "build/app.jar:$WG_KT_CP" MainKt "$@" 2>&1 | grep -v 'JAVA_TOOL_OPTIONS'
exit "${PIPESTATUS[0]}"
