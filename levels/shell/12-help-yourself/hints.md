## 1
Options are looked up in the manual: `man ls`, then type `/hidden` or look for "dot" — the letter you want is `-a` (all).
## 2
`ls -a` lists everything, hidden files included. Redirect it: `ls -a > listing.txt` while standing in the sandbox.
## 3
    cd ~/.k8s-wargame/shell/sandbox
    ls -a > listing.txt
