# the shell — 10 things to know before your first command
  the terminal                  a window where you type to the computer instead of clicking
  the prompt                    the text with the blinking cursor, usually ending in $ or % — it means "your turn"
  a command                     one line: a word, maybe more words, then Enter. The computer does it and hands the prompt back
  silence = success             many commands print nothing when they worked. Trouble is always words
  echo hello                    the first word is the command; the words after it are its arguments (the details)
  the current folder            you always stand in one folder.  pwd  says which,  ls  shows what is in it,  cd NAME  moves you
  ~   .   ..                    your home folder  ·  this folder  ·  the folder above
  ↑  and  Tab                   ↑ brings back your last command; Tab finishes a name for you. Use both all the time
  Ctrl+C  and  q                Ctrl+C stops a command that hangs;  q  quits a reader like less or man
  no undo                       rm deletes for good. Everything in this track happens inside  ~/.k8s-wargame/shell/sandbox  — nothing else can break

Mental model: type → Enter → the computer answers (or silently does it) → your turn again.
Every level: read the lesson, go to the sandbox (cd ~/.k8s-wargame/shell/sandbox), do the one small task, then  wg check.  Stuck?  wg hint  — three times if needed.
