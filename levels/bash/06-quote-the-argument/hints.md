## 1
Run `catf.sh 'my notes.txt'` and read the error: cat is getting two arguments, `my` and `notes.txt`.
## 2
Unquoted `$1` is split on whitespace, so a filename with a space becomes two words.
## 3
Quote the expansion: `cat "$1"`.
