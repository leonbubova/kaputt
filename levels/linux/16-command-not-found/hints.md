## 1
The shell finds commands by walking the directories listed in `PATH`; "command not found" for `ls` means the usual directories are no longer on that list. `su - deploy` then `echo $PATH`. Compare with root's. What is missing?
## 2
The PATH is set in a login file of `deploy`: `grep -n PATH /home/deploy/.profile /home/deploy/.bashrc`. It *replaces* PATH instead of appending.
## 3
Change the line to `PATH="$PATH:/opt/deploy/bin"`.
