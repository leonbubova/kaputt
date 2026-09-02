# a symlink is a name pointing at a path; if the target is gone, the link dangles
Lesson: a symbolic link is a tiny file that contains another path. `ls` lists the link like any file, but opening it makes the kernel follow the stored path and open *that* instead. The link itself never holds content.
That is what makes it useful — a rollout is one link swap — and confusing when it breaks. If the target is renamed or deleted, the link stays and still shows up in `ls`, but opening it fails with "No such file or directory". The name exists; the thing behind it does not.
`ls -l` marks links with `l` and shows `name -> target`. `readlink -f` resolves the full chain. `ln -sfn TARGET LINK` creates or replaces a link in one go (`-f` overwrite, `-n` do not descend into an existing link).
    ls -l DIR                        links show as name -> target
    readlink -f LINK                 where it really points
    ln -sfn TARGET LINK              create or repoint a link
Try it first: `ls -l /bin` or `ls -l /etc/alternatives | head` — the system is full of links.
Your task: "`/opt/app/show-config` fails: `/etc/app/config.yaml: No such file or directory`. `ls /etc/app` clearly lists config.yaml. We rolled out config v2 an hour ago."
Goal: `/etc/app/config.yaml` resolves to the v2 config (`release: v2`, `listen_port: 9000`).
Check yourself:  wg check      stuck?  wg hint
