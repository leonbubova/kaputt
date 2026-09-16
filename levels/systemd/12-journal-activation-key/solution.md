The key is in the unit's journal.
    journalctl -u wg-license -o cat | sed -n 's/^activation key: //p' | tail -1 > /opt/wg/license/key
