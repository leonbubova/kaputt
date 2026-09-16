source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /srv/notes
echo "ship on friday" > /srv/notes/plan.txt
chown root:root /srv/notes/plan.txt; chmod 666 /srv/notes/plan.txt
IN
