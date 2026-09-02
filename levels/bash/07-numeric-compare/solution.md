`>` is a lexical (string) comparison; use the numeric operator.
    if [ "$1" -gt "$2" ]; then echo "$1"; else echo "$2"; fi
