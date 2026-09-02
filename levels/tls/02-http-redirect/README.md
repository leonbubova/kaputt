# port 80 should not serve content: it answers with a 301 to the https URL
Lesson: having HTTPS does not stop anyone from using HTTP. Every link, bookmark and typed address that starts with http:// still lands on port 80, and if that server serves the page, the traffic stays in cleartext. The fix is a policy, not a feature: port 80 answers nothing but "go to the https version of exactly this URL".
In nginx that is a `return 301` in the port-80 server. `$host` and `$request_uri` are variables that echo back what the client asked for, so one line redirects every path on every hostname. 301 means permanent — browsers cache it and stop asking.
A pure config change like this only needs a reload; nginx re-reads conf.d without dropping connections.
    return 301 https://$host$request_uri;                             the redirect, in the listen-80 server
    curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:9080/     status only: 200 or 301?
    curl -sI http://127.0.0.1:9080/                                   headers: Location shows the target
    docker exec wg-tls nginx -t; docker exec wg-tls nginx -s reload   check, then apply
Try it first: `curl -sI http://127.0.0.1:9080/` — look at the status line and whether there is a Location header.
Your task: requests to http://shop.local/ are served over cleartext instead of being pushed to HTTPS. Make port 80 issue a 301 redirect to the https:// URL.
Check yourself:  wg check      stuck?  wg hint
