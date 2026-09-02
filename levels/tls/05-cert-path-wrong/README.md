# nginx opens every file in its config at startup — a wrong path is fatal, and paths are container paths
Lesson: nginx does not open certificates lazily when the first client arrives. It reads every `ssl_certificate` and `ssl_certificate_key` while parsing the config, and a file it cannot open is a config error like any typo: the whole server exits. "No such file or directory" in the log means exactly that — the path as written does not exist where nginx looks.
Where nginx looks is inside the container. The certs directory you edit on the host is bind-mounted to /etc/nginx/certs, so a config path must be the container-side one, and the file must actually be there under that name. Listing the directory from inside the container removes any guesswork.
`nginx -t` runs the same parse without starting anything, so you can catch a bad path before you restart.
    docker logs wg-tls                                     the exact file nginx could not open
    docker exec wg-tls ls /etc/nginx/certs                 what actually exists, container view
    docker exec wg-tls nginx -t                            test the config before restarting
    docker restart wg-tls                                  bring a dead container back
Try it first: `docker exec wg-tls ls /etc/nginx/certs` — compare it with the paths in your conf.d/default.conf.
Your task: nginx is down. The TLS server references a certificate path that doesn't exist, so nginx fails to start. The real certificate is /etc/nginx/certs/fullchain.crt. Fix the path.
Check yourself:  wg check      stuck?  wg hint
