source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'rm -rf /opt/wg/hello; mkdir -p /opt/wg/hello'
unit_file wg-hello.service <<'U'
[Unit]
Description=my first unit

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'echo hello > /opt/wg/hello/out'
U
SC start wg-hello.service >/dev/null 2>&1 || true
