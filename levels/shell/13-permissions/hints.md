## 1
`./hello.sh` fails with "Permission denied" because the file lacks the execute permission. `chmod +x FILE` adds it.
## 2
In the sandbox: `chmod +x hello.sh`, then `ls -l hello.sh` shows an x, then `./hello.sh` runs it.
## 3
    cd ~/.k8s-wargame/shell/sandbox
    chmod +x hello.sh
    ./hello.sh
