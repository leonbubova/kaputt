## 1
`su - deploy` then `echo $PATH`. Compare with root's. What is missing?
## 2
The PATH is set in a login file of `deploy`: `grep -n PATH /home/deploy/.profile /home/deploy/.bashrc`. It *replaces* PATH instead of appending.
## 3
Change the line to `PATH="$PATH:/opt/deploy/bin"`.
