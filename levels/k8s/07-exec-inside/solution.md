Open a shell inside the pod, write the file there.
    kubectl exec -it box -- sh      then inside:  echo hi > /tmp/hello.txt ; exit
