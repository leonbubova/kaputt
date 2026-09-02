source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
printf '# ops team gets passwordless sudo\n%%ops ALL=(ALL) NOPASSWD: ALL\n' > /etc/sudoers.d/ops
chmod 440 /etc/sudoers.d/ops
IN
