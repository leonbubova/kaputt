# try_files walks a list of candidates, and the last one is what happens when nothing exists
Lesson: for a static location nginx maps the URL onto `root` and looks for a file. `try_files A B C;` makes that lookup explicit: check A on disk, then B, and if neither exists do C. The last argument is not checked — it is the fallback: an internal jump to a URI, or `=CODE` for a fixed status.
`$uri` is the requested path; `$uri/` is the same as a directory (served via `index`). So `try_files $uri $uri/ /index.html;` means: real file, real directory, otherwise hand out the app shell. That is the single-page-app pattern: any deep link gets index.html and the client-side router reads the URL.
End the list with `=404` instead and every path that is not on disk is a hard 404 — fine for a classic site, fatal for deep links.
    try_files $uri $uri/ /index.html;                   file, dir, then SPA fallback
    try_files $uri $uri/ =404;                          file, dir, else 404
    docker exec wg-nginx ls /usr/share/nginx/html       what actually exists under root
    curl -s -o /dev/null -w '%{http_code}\n' -H 'Host: shop.local' http://127.0.0.1:8082/dashboard
Try it first: run the ls line — /dashboard is not there, so whatever the curl returns comes from the fallback alone.
Your task: the SPA serves index.html for unknown paths so the client router can take over. After a config edit, reloading a deep link like /dashboard now returns 404. Restore the fallback to index.html.
Check yourself:  wg check      stuck?  wg hint
