source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
pkill -f /opt/tick/tick.sh 2>/dev/null
mkdir -p /opt/tick
cat > /opt/tick/tick.sh <<'S'
#!/bin/bash
# ticks forever — a stand-in for a stuck program
while true; do sleep 5; done
S
chmod 755 /opt/tick/tick.sh
IN
XD /opt/tick/tick.sh
sleep 1
