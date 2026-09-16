## 1
What a service prints goes into the journal, not to a screen. `journalctl -u NAME` shows all of it; the word is in the line starting with `secret word:`.
## 2
`journalctl -u wg-greeter` — read the word, then `echo THEWORD > /opt/wg/greeter/word` (replace THEWORD with what you read).
## 3
    journalctl -u wg-greeter
    echo THEWORD > /opt/wg/greeter/word
(or in one go: `journalctl -u wg-greeter -o cat | sed -n 's/^secret word: //p' > /opt/wg/greeter/word`)
