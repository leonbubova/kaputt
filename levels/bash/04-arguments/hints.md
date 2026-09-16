## 1
Inside the script, `$1` holds whatever the user typed first after the script name, `$2` the second word. Print each in a labelled line.
## 2
    echo "first: $1"
    echo "second: $2"
Double quotes again — `$1` is a variable like any other.
## 3
    #!/usr/bin/env bash
    echo "first: $1"
    echo "second: $2"
then `chmod +x two.sh` and `./two.sh Ada Bob`.
