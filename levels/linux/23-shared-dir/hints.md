## 1
Create a file as bob and look at it: `su - bob -c 'touch /srv/share/t; ls -l /srv/share/t'`. Which *group* does it get?
## 2
New files inherit the creator's primary group (`bob`), not the directory's — unless the directory has the setgid bit.
## 3
`chmod g+s /srv/share` (→ `drwxrwsr-x`). Now new files are group `dev`, and with umask 002 they are group-writable.
