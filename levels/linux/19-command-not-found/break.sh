source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /opt/deploy/bin
printf '#!/bin/bash\necho "deploytool 1.0 ok"\n' > /opt/deploy/bin/deploytool; chmod 755 /opt/deploy/bin/deploytool
cat >> /home/deploy/.profile <<'P'

# deploy tooling (added by rollout 2026-08)
PATH=/opt/deploy/bin
export PATH
P
IN
