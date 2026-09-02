# your first command
Lesson: the window you are looking at is a terminal. Inside it a program called the shell waits for you to type.
The short text on the left with the blinking cursor is the prompt — it means "your turn". You type a command,
press Enter, the computer does it, and the prompt comes back: your turn again. That is the whole game.
Try it — type this line and press Enter:
    echo hello
The computer answers `hello`. `echo` means "say this back to me". Try `echo good morning` as well.
Your task: make the computer put its answer into a file instead of the screen. Type this exactly, then Enter:
    echo hello > ~/.k8s-wargame/shell/sandbox/hello.txt
Nothing appears — the word went into the file. (The `>` and the `~` get their own lessons later; for now just type them.)
Check yourself:  wg check      stuck?  wg hint
