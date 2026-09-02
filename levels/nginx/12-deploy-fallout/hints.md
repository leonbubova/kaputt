## 1
Two independent faults: one in the /api/ proxy, one in the `location /` try_files. Check both.
## 2
502 points at a wrong upstream port (backend is 9000). The 404 is try_files ending in =404.
## 3
Fix the port to 9000 and set try_files to end in /index.html, then reload.
