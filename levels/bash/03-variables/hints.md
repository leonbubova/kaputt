## 1
Line one stores the value: `city=Berlin` (no spaces). Line two prints a double-quoted string that contains `$city`.
## 2
    city=Berlin
    echo "I live in $city"
Double quotes, not single — inside single quotes `$city` stays as letters.
## 3
    #!/usr/bin/env bash
    city=Berlin
    echo "I live in $city"
then `chmod +x vars.sh` and `./vars.sh`.
