# the shebang is a literal path: invisible bytes make it a different file
Lesson: when you run a script, the kernel reads its first line. `#!/bin/bash` means "start `/bin/bash` and hand it this file". The path is taken byte for byte, no cleanup — every character up to the end of the line is part of the filename it looks for.
So a shebang can fail while the interpreter clearly exists: a trailing space, a wrong slash, or a Windows line ending. Windows ends lines with two bytes, CR and LF (`\r\n`); Linux with LF only. A file edited on Windows carries an extra `\r` on every line, and the kernel then looks for `/bin/bash\r` — "bad interpreter: No such file or directory".
Terminals hide these bytes. Make them visible before guessing.
    head -1 FILE | cat -A      show every byte; ^M is a carriage return, $ is end of line
    file FILE                  says "with CRLF line terminators" when that is the case
    sed -i 's/\r$//' FILE      strip the CR at the end of every line
    dos2unix FILE              same thing, if installed
Try it first: `printf 'a\r\n' | cat -A` — a line that looks empty but is not.
Your task: "Someone edited `/usr/local/bin/report` on their laptop and copied it back. Now it says `/bin/bash: bad interpreter`. `/bin/bash` exists, we checked."
Goal: `report` runs and prints the user count line. Keep the script's logic.
Check yourself:  wg check      stuck?  wg hint
