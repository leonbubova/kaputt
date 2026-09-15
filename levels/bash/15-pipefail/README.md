# script says success even when the file is missing
"`firstword.sh FILE` prints the first word of a file's first line. Trouble: when FILE does not exist it prints nothing but still exits 0, so the caller thinks it worked. It must fail (non-zero) when the file is missing."
Goal: `firstword.sh data.txt` prints `alpha` and exits 0; `firstword.sh nope.txt` exits non-zero.
