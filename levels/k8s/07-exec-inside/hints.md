## 1
`kubectl exec -it box -- sh` puts you inside the pod. Whatever you type at the `/ #` prompt happens in the pod, not on your computer.
## 2
Inside, `echo hi > /tmp/hello.txt` creates the file; `cat /tmp/hello.txt` shows it; `exit` leaves. The file must be inside `box`, not on your own machine.
## 3
    kubectl exec -it box -- sh
    echo hi > /tmp/hello.txt
    exit
