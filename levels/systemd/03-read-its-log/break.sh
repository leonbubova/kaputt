source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
words=(tomato walrus pretzel lantern marble cactus violin); word=${words[$((RANDOM % 7))]}
XS "rm -rf /opt/wg/greeter; mkdir -p /opt/wg/greeter; printf '%s\n' '$word' > /run/wg-greeter.seed; chmod 600 /run/wg-greeter.seed"
script /opt/wg/greeter/greeter.sh <<'X'
#!/bin/bash
# wg-greeter: says hello once, then exits
w=$(cat /run/wg-greeter.seed 2>/dev/null); rm -f /run/wg-greeter.seed
echo "greeter starting"
echo "secret word: $w"
echo "greeter done"
X
unit_file wg-greeter.service <<'U'
[Unit]
Description=wg greeter

[Service]
Type=oneshot
ExecStart=/opt/wg/greeter/greeter.sh
U
SC start wg-greeter.service >/dev/null 2>&1 || true
rec word "$word"
