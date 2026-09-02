## 1
`cd FOLDER` moves you into a folder; afterwards `pwd` should end in `/kitchen`. Files you create then land right there.
## 2
    cd ~/.k8s-wargame/shell/sandbox/kitchen
then `echo SOMETHING > i-was-here.txt` — no path needed, you are already inside.
## 3
    cd ~/.k8s-wargame/shell/sandbox/kitchen
    echo hi > i-was-here.txt
