## 1
A certificate has a subject (whose it is) and an issuer (who signed it). `openssl x509 -noout -in FILE` plus one flag per field prints exactly that field, one line each.
## 2
Two commands, two lines: `openssl x509 -noout -subject -in shop.crt` and the same with `-issuer`. Send the first into who.txt with `>`, add the second with `>>`. (Or both flags in one command: `-subject -issuer`.)
## 3
    cd ~/.k8s-wargame/tls/lab
    openssl x509 -noout -subject -issuer -in shop.crt > who.txt
