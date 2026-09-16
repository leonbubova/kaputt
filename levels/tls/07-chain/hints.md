## 1
A fullchain file is nothing special: the two certificate files glued together, leaf first. `cat A B > C` glues files.
## 2
`cat leaf.crt int.crt > fullchain.crt` — order matters: leaf, then intermediate. Check with `grep -c BEGIN fullchain.crt` (2) and the verify command from the task.
## 3
    cd ~/.k8s-wargame/tls/lab
    cat leaf.crt int.crt > fullchain.crt
    openssl verify -CAfile root.crt -untrusted fullchain.crt leaf.crt
