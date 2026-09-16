## 1
Three lines: `for NAME in LIST; do`, an echo of the variable, `done`. The list is the three fruits separated by spaces.
## 2
`for fruit in apple pear plum; do echo "$fruit"; done` — the echo prints only the variable, nothing else.
## 3
    #!/usr/bin/env bash
    for fruit in apple pear plum; do
      echo "$fruit"
    done
then `chmod +x fruits.sh` and `./fruits.sh`.
