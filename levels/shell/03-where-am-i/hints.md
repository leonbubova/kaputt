## 1
The shell always stands inside one folder, and a plain file name means "the one in this folder". `cd FOLDER` moves you in; afterwards `pwd` should end in `/kitchen`, and files you create land right there.
## 2
    cd ~/.k8s-wargame/shell/sandbox/kitchen
then `echo SOMETHING > i-was-here.txt` — no path needed, you are already inside.
## 3
    cd ~/.k8s-wargame/shell/sandbox/kitchen
    echo hi > i-was-here.txt
