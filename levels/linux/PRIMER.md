# linux — the commands you'll actually use
  ls -la                    list everything incl. hidden files and permissions
  cd / pwd                  move around / where am i
  cat / less <file>         read a file (less = scrollable, q to quit)
  grep -rn "text" <dir>     find which file contains text
  find <dir> -name "*.log"  find files by name
  chmod 640 <file>          set permissions (owner rw, group r)
  chown user:group <file>   set owner
  ps aux | grep <name>      what's running
  kill <pid>                stop a process
  df -h / du -sh <dir>      disk free / how big is this dir
  tail -f <log>             follow a log live

Mental model: everything is a file with an owner and a mode. "Permission denied" = check `ls -la`. "Command not found" = check PATH or the shebang.
