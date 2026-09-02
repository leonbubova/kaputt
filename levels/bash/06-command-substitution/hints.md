## 1
`whoami` prints the name — on its own line, straight to the terminal. You need that output *inside* your string, which means capturing it instead of letting it print.
## 2
`$( command )` runs the command and expands to whatever it printed, so you can put it in a string or a variable: `name=$(whoami)`.
## 3
`echo "user: $(whoami)"` — write it to whoran.sh.
