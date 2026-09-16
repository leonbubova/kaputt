# a certificate expires
Lesson: every certificate is only valid between two dates, `notBefore` and `notAfter`. After notAfter
browsers refuse it — an expired certificate is the most common way a website "breaks" without anyone
touching it. `openssl x509` shows the dates with `-dates` (both) or `-enddate` (just notAfter).
`-text` prints everything in the certificate as readable text: the dates under "Validity", the subject,
the issuer, the public key, the signature. It is long — pipe it into `less` and press q to leave.
Try it:
    cd ~/.k8s-wargame/tls/lab
    openssl x509 -noout -dates -in shop.crt
    openssl x509 -noout -enddate -in shop.crt
    openssl x509 -noout -text -in shop.crt | less
Your task: write the notAfter line — exactly as `-enddate` prints it, `notAfter=…` — into the file
`~/.k8s-wargame/tls/lab/expires.txt`.
Work in ~/.k8s-wargame/tls/lab.
Check yourself:  wg check      stuck?  wg hint
