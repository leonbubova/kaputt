The word is in the unit's journal.
    journalctl -u wg-greeter -o cat | sed -n 's/^secret word: //p' | tail -1 > /opt/wg/greeter/word
