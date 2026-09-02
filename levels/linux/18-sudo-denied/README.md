# alice is "not in the sudoers file"
"alice joined the ops team and was added to the group yesterday, but `sudo` still says she is not in the sudoers file. bob (not ops) must NOT get sudo."
Goal: `su - alice -c 'sudo -n id -u'` prints `0`; `su - bob -c 'sudo -n true'` still fails.
