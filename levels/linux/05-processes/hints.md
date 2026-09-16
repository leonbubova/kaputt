## 1
Every running program has a PID — the second column of `ps aux`. Find the line that ends in `/opt/tick/tick.sh` (not the grep line).
## 2
`ps aux | grep tick.sh` → read the PID in column 2 → `kill THATNUMBER`. Then `ps aux | grep tick.sh` again: only the grep line is left.
## 3
    ps aux | grep tick.sh
    kill <PID from column 2>
