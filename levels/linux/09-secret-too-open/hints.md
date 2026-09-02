## 1
Run it yourself: `su - app -c /opt/app/start`. The message names the file. `ls -l` it.
## 2
`644` means group and others can read the secret. The app (like sshd) wants owner-only.
## 3
`chmod 600 /etc/app/secret.key`
