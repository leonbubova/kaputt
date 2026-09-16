## 1
`df` tells you the disk is full, `du` tells you where the bytes are. Ask `du` for every folder inside `/var/lib/appdata` at once.
## 2
`du -sh /var/lib/appdata/*` — one line per folder, size first. The one showing ~20M is the answer; write its name with `echo NAME > /answer`.
## 3
    du -sh /var/lib/appdata/*
    echo cache > /answer
