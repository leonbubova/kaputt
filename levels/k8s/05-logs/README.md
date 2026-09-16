# logs: what a pod printed
Lesson: a program running in a pod prints text as it works — start-up messages, errors, whatever it wants to
say. Kubernetes collects that text; it is called the logs. You cannot see the pod's screen, so logs are how
you find out what happened inside.
    kubectl logs NAME              print everything the pod has printed so far
Try it — a pod named `talker` is running and has printed a few lines:
    kubectl get pods
    kubectl logs talker
Your task: one line in those logs says `the secret word is: …`. Write that word — just the word, nothing else —
into the file `~/.k8s-wargame/k8s/word.txt` (shell lesson 1: `echo WORD > FILE`).
Where: your normal terminal. `wg start` already pointed `kubectl` at the wargame cluster, and namespace `wg` is your default — no extra flags needed.
Check yourself:  wg check      stuck?  wg hint
