source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
printf '#!/bin/bash\r\n# nightly user report\r\nn=$(grep -c ":/home/" /etc/passwd)\r\nprintf "report: %%s users\\n" "$n"\r\n' > /usr/local/bin/report
chmod 755 /usr/local/bin/report
IN
