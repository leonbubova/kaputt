# file modes: three digits say what owner, group and others may do
Lesson: besides owner and group, every file has a mode. It answers three questions: what may the owner do, what may the group do, what may everyone else do. Each answer is a combination of read, write and execute.
Written as digits: r=4, w=2, x=1, added up per slot. `640` means owner 4+2 (read and write), group 4 (read only), others 0 (nothing). `ls -l` shows the same thing as letters: `-rw-r-----`. `666` — anyone can write — is what an audit flags on a config with a password in it.
Owner and group are set with `chown`, the mode with `chmod`. They are separate tools for separate fields; a lock-down usually needs both. Neither touches the file content.
    ls -l FILE                    owner, group and mode as letters
    stat -c '%U:%G %a' FILE       the same as name:group and digits
    chown app:app FILE            set owner and group
    chmod 640 FILE                set the mode
Try it first: `stat -c '%a %A' /etc/passwd /etc/shadow` — one world-readable, one not.
Your task: "Audit finding: `/etc/app/db.conf` is world-writable. It must be owned by `app`, group `app`, mode exactly `640` (`-rw-r-----`)." Don't change the content.
Goal: `stat -c '%U:%G %a' /etc/app/db.conf` → `app:app 640`.
Check yourself:  wg check      stuck?  wg hint
