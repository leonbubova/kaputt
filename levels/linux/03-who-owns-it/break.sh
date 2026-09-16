source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /srv/notes
echo "buy milk" > /srv/notes/todo.txt
chown root:root /srv/notes/todo.txt; chmod 644 /srv/notes/todo.txt
IN
