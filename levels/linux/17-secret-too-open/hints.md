## 1
Programs that guard secrets check the key file's *mode*, not just its content — if anyone besides the owner could read it, they refuse to start. Run it yourself: `su - app -c /opt/app/start`. The message names the file. `ls -l` it.
## 2
`644` means group and others can read the secret. The app (like sshd) wants owner-only.
## 3
`chmod 600 /etc/app/secret.key`
