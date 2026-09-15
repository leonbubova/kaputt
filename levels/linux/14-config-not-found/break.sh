source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /etc/app/versions /opt/app
printf 'release: v1\nlisten_port: 8000\n' > /etc/app/versions/config-v1.yaml
printf 'release: v2\nlisten_port: 9000\n' > /etc/app/versions/config-v2.yml
ln -sfn /etc/app/versions/config-v2.yaml /etc/app/config.yaml
cat > /opt/app/show-config <<'S'
#!/bin/bash
cat /etc/app/config.yaml || exit 1
S
chmod 755 /opt/app/show-config
IN
