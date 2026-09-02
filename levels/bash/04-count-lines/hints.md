## 1
The file to read is `$1`. You need the number of lines in it.
## 2
`wc -l < "$1"` prints the count. Redirecting with `<` avoids printing the filename.
## 3
`echo $(wc -l < "$1")` — the `$( )` strips wc's padding. Or count in a read loop.
