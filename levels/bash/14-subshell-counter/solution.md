A variable set inside a piped `while` lives in a subshell and is lost.
    count=$(grep -c "$2" "$1"); echo "$count"
