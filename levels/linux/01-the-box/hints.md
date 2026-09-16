## 1
The box is a separate machine. Files you create in your own terminal land on your computer, not on the box. First `wg shell` — the prompt must show `root@prod-app-01` — then work.
## 2
On the box: `echo hello > /root/i-am-in.txt`. Look with `cat /root/i-am-in.txt`. Then `exit` and `wg check`.
## 3
    wg shell
    echo hello > /root/i-am-in.txt
    exit
