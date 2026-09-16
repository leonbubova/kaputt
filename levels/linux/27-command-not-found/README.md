# deploy user: every command is "not found"
"Since the new deploy tooling was rolled out, logging in as `deploy` gives `ls: command not found`, `vim: command not found`… only `deploytool` works."
Goal: `su - deploy -c 'ls / && deploytool'` succeeds — normal commands AND `deploytool` on the login PATH.
