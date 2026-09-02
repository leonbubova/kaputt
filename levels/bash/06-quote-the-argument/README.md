# 'cat: my: No such file or directory' — but the file is right there
"`catf.sh FILE` prints a file's contents. It works for `report.txt` but blows up on `my notes.txt`. The file exists; the script is wrong. Don't rename the file."
Goal: `catf.sh 'my notes.txt'` prints the file's contents (`secret`).
