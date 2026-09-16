## 1
Changing one line inside a file is a search-and-replace job, not a rewrite. `sed 's/OLD/NEW/' FILE` prints the file with every `OLD` replaced — try it first, it does not touch the file: `sed 's/^workers=2$/workers=4/' /etc/app/app.conf`.
## 2
`^` and `$` pin the match to a whole line, so `port=9000` and the comment are left alone. Happy with the output? Add `-i` and sed writes the result back into the file instead of printing it.
## 3
`sed -i 's/^workers=2$/workers=4/' /etc/app/app.conf`, then `cat /etc/app/app.conf`.
