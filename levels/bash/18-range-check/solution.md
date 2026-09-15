Two causes: string `<`/`>` (use numeric) and exclusive bounds (use -ge/-le).
    if [ "$1" -ge "$2" ] && [ "$1" -le "$3" ]; then echo yes; else echo no; fi
