## 1
`getent hosts lab.internal` prints the address and the name on one line. The same line is in `/etc/hosts`.
## 2
The first word of that line is the address — `echo ADDRESS > /root/lab-ip.txt`.
## 3
    getent hosts lab.internal
    echo 10.42.0.7 > /root/lab-ip.txt
