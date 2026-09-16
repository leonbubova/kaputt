## 1
The lesson's five-line example is the answer's shape: test `$1` against the word open, one echo in the `then` part, one in the `else` part.
## 2
`if [ "$1" = "open" ]; then … else … fi` — spaces inside the brackets, quotes around `$1`, and `fi` at the end.
## 3
    #!/usr/bin/env bash
    if [ "$1" = "open" ]; then
      echo "come in"
    else
      echo "go away"
    fi
then `chmod +x door.sh`, `./door.sh open`, `./door.sh shut`.
