## 1
`kubectl describe pod` → Last State. Look at the Reason and the Exit Code.
## 2
Exit code 137 = SIGKILL from the kernel, Reason OOMKilled. The container hit its memory *limit*.
## 3
Raise the limit above what the app needs: `kubectl set resources deploy/cache --limits=memory=128Mi`.
