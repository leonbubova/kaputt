# bash — what bites everyone
  "$var"  not  $var              always quote — unquoted vars split on spaces
  [[ "$a" == "$b" ]]              string compare;   (( a == b )) / -eq for numbers
  set -euo pipefail               fail fast: on error, unset var, or a failing pipe stage
  $?  and  ${PIPESTATUS[@]}       exit code of last command / of each pipe stage
  while read -r line; do … done < file     read lines (the pipe version runs in a subshell!)
  local x                         inside functions, or you leak globals
  "$@"  vs  $*                    pass args through intact
  bash -x script.sh               trace every line — the debugger

Mental model: a variable disappearing, a loop not counting, a comparison always false — it's quoting, a subshell, or string-vs-number. `bash -x` shows which.
