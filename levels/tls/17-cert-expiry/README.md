# compliance wants the expiry date of the live certificate on record
The audit checklist needs the "not after" date of the certificate the edge serves
(certs/fullchain.crt). Put the notAfter line exactly as openssl prints it into
~/.k8s-wargame/tls/app/certs/EXPIRES.txt.
