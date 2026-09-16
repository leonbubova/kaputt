## 1
`ss -ltnp` prints one line per listening program. Find the line whose end says `"nc"`; the number after the colon in its `Local Address:Port` column is the port.
## 2
The line looks like `LISTEN 0 … 0.0.0.0:NNNN … users:(("nc",pid=…))`. NNNN is what goes into `/root/port.txt`.
## 3
    ss -ltnp
    echo 4321 > /root/port.txt
