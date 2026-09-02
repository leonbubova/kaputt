# secrets are owner-only: programs check a key file's mode and refuse it
Lesson: a private key or password file is only private if nobody else can read it. Careful programs — ssh, and many app launchers — do not trust the content alone: they look at the file's mode and refuse to start if group or others have any access. The fix is never in the program; it is on the file.
Owner-only is mode `600` (`-rw-------`): owner reads and writes, everyone else nothing. `644` looks harmless but means every user on the box can read the secret.
Reproduce as the user the service runs as, not as root. `su - USER -c COMMAND` runs one command as that user; the error message it prints usually names the offending file. Then `ls -l` that file and read the mode.
    su - app -c /opt/app/start     run the command as user app
    ls -l FILE                     mode: -rw------- is owner-only
    chmod 600 FILE                 owner read/write, nothing for anyone else
Try it first: `ls -l /etc/shadow` — the system's own password file is not world-readable.
Your task: "After someone copied the signing key onto the box, `/opt/app/start` dies immediately with a message about the key file. Runs as user `app`."
Goal: `su - app -c /opt/app/start` prints `app started`. Don't touch the start script or the key content.
Check yourself:  wg check      stuck?  wg hint
