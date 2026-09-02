## 1
Every command leaves a number behind when it finishes — 0 for success, anything else for failure. The shell keeps the last one in `$?`; run `notready.sh; echo $?` to see what yours returns now.
## 2
A script ends with the status of its last command unless it says otherwise. `exit N` ends the script right there with status N.
## 3
`echo 'not ready'; exit 3` — write it to notready.sh.
