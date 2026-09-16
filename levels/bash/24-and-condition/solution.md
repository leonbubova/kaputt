Join two tests with && so both must hold.
    if [ "$1" -gt 0 ] && [ $(($1 % 2)) -eq 0 ]; then echo yes; else echo no; fi
