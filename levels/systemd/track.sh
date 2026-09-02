# track: real systemd on a remote Ubuntu box (default: station44) — units wg-*.service, dirs /opt/wg, /etc/wg. See README-track.md
source "$WG_ROOT/levels/systemd/lib.sh"
track_start() {
  $SSH "$H" true 2>/dev/null || { echo "cannot ssh to $H (set WG_SYSTEMD_HOST or fix ~/.ssh/config)" >&2; return 1; }
  X true 2>/dev/null || { echo "passwordless sudo on $H required" >&2; return 1; }
  echo "using $H: $(X systemctl --version | head -1)"
  XS 'id wg-app >/dev/null 2>&1 || useradd -r -s /usr/sbin/nologin -d /nonexistent wg-app; mkdir -p /opt/wg'
}
track_stop()  { track_wipe; XS 'userdel wg-app 2>/dev/null || true'; }
track_ready() { X true >/dev/null 2>&1; }
track_wipe()  { XI <<'IN'
set +e
units=$(systemctl list-units --all --plain --no-legend 'wg-*' | awk '{print $1}')
[ -n "$units" ] && { systemctl stop $units >/dev/null 2>&1; systemctl disable $units >/dev/null 2>&1; }
systemctl reset-failed >/dev/null 2>&1
pkill -9 -u wg-app 2>/dev/null
rm -rf /etc/systemd/system/wg-* /etc/systemd/system/*.wants/wg-* /etc/systemd/system/*.requires/wg-* /run/systemd/system/wg-*
rm -rf /opt/wg /etc/wg /run/wg-*
systemctl daemon-reload; systemctl reset-failed >/dev/null 2>&1
mkdir -p /opt/wg
IN
}
track_shell() { exec ssh -t "$H" 'sudo -i'; }
