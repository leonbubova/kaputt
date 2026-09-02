# find walks a whole tree and filters by name
Lesson: `ls` shows one directory. When a file could be anywhere below a directory — including hidden subdirectories — you need `find`. It starts at the directory you give it, visits every file underneath, and prints the full path of each one that matches your filters.
`-name PATTERN` matches the filename only, the last part of the path, and matches it exactly: `license.key` does not match `license.key.bak`. Quote the pattern if it contains `*` so the shell does not expand it first.
The output of `find` is plain text, one path per line, so it can be sent into a file with `>` like any other output.
    find /var -name license.key       every file with exactly that name below /var
    find /var -name "*.key"           wildcard: any file ending in .key
    find /var -type d -name acme      directories only
    find /var -name X > /answer       save the result
Try it first: `find /etc -name "*.conf" | head` — paths from all over the tree, several levels deep.
Your task: "The acme installer dropped a file called `license.key` somewhere under `/var`. Nobody wrote down where. Find it and write its full path to `/answer`." (Ignore backups — we want the live `license.key`.)
Goal: `/answer` contains the absolute path of `license.key`.
Check yourself:  wg check      stuck?  wg hint
