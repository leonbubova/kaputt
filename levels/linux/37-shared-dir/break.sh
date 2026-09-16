source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /srv/share; chown root:dev /srv/share; chmod 775 /srv/share
echo 'umask 002' > /etc/profile.d/share-umask.sh
su - bob -c 'echo "notes from bob" > /srv/share/notes.txt'
IN
