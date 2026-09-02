# helpers for systemd levels — sourced after lib/common.sh. Everything runs on the remote box via ssh + sudo.
H=${WG_SYSTEMD_HOST:-station44}
SSH="ssh -o BatchMode=yes -o ConnectTimeout=10 -o LogLevel=ERROR -o ControlMaster=auto -o ControlPath=$HOME/.ssh/wg-cm-%C -o ControlPersist=300"
X()  { $SSH "$H" sudo -n "$@"; }                  # run a command as root on the box (args must not contain spaces)
XI() { $SSH "$H" sudo -n bash -s; }               # run a root shell script from stdin (heredoc)
XS() { printf '%s\n' "$1" | XI; }                 # run a root shell snippet
SC() { X systemctl "$@"; }
prop()   { X systemctl show "$1" -p "$2" --value 2>/dev/null; }   # unit property
loaded() { [ "$(prop "$1" LoadState)" = loaded ]; }
active() { X systemctl is-active --quiet "$1" 2>/dev/null; }
enabled(){ [ "$(X systemctl is-enabled "$1" 2>/dev/null)" = enabled ]; }
EXPECT=/opt/wg/.expect                            # hashes recorded by break.sh (on the box), compared by check.sh
rec()  { XS "mkdir -p /opt/wg; echo '$1=$2' >> $EXPECT"; }
exp()  { XS "sed -n 's/^$1=//p' $EXPECT 2>/dev/null | tail -1"; }
sha()  { X sha256sum "$1" 2>/dev/null | cut -d' ' -f1; }
unchanged() { [ "$(sha "$1")" = "$(exp "$2")" ]; }      # unchanged path key
# retry until snippet exits 0 (1s apart); honours WG_FAST
wait_ok() { # seconds snippet
  local t=$1 i=0; [ -n "${WG_FAST:-}" ] && t=6
  while [ $i -lt "$t" ]; do XS "$2" >/dev/null 2>&1 && return 0; sleep 2; i=$((i+2)); done; return 1; }
# seconds since file was last modified (empty if missing)
age() { XS "f=$1; [ -f \$f ] && echo \$(( \$(date +%s) - \$(stat -c %Y \$f) ))"; }
# install a unit file from stdin: unit_file NAME <<'U' … U   (daemon-reload included)
unit_file() { { echo "cat > /etc/systemd/system/$1 <<'WGUNIT'"; cat; echo "WGUNIT"; echo "systemctl daemon-reload"; } | XI; }
# install an executable script from stdin: script PATH <<'S' … S
script() { { echo "mkdir -p $(dirname "$1"); cat > $1 <<'WGSCRIPT'"; cat; echo "WGSCRIPT"; echo "chmod 755 $1"; } | XI; }
