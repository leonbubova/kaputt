# helpers for linux levels — sourced after lib/common.sh
C=${WG_LINUX_C:-wg-linux}
X()  { docker exec "$C" "$@"; }              # run a command in the box
XS() { docker exec "$C" bash -c "$1"; }      # run a shell snippet
XI() { docker exec -i "$C" bash -s; }        # run a script from stdin (heredoc)
XD() { docker exec -d "$C" "$@"; }           # start a background process
# retry N times (1s apart) until snippet succeeds and prints something matching pattern
wait_out() { # tries pattern snippet
  local i=0; while [ $i -lt "$1" ]; do XS "$3" 2>/dev/null | grep -q -- "$2" && return 0; sleep 1; i=$((i+1)); done; return 1; }
