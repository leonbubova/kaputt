Branch on n % 2 and set the exit code explicitly.
    if [ $(($1 % 2)) -eq 0 ]; then echo even; exit 0; else echo odd; exit 1; fi
