# change the config — then reload
Lesson: nginx reads its config file once, when it starts. Editing the file changes nothing on its own: nginx keeps
answering with what it read last. To make it read the file again you tell it to reload. nginx runs inside a box
(a docker container) named wg-nginx; `docker exec wg-nginx COMMAND` runs COMMAND inside that box:
    docker exec wg-nginx nginx -s reload
Reload keeps nginx running — nobody notices, except that the answers change.
Try it: open `~/.k8s-wargame/nginx/app/conf.d/default.conf` in an editor and look at the /health block again:
    location = /health {
        default_type text/plain;
        return 200 "ok\n";
    }
`return 200 "ok\n";` is the answer; `\n` is the line break at the end. Change ok to something else, save, then
    curl -H 'Host: shop.local' http://127.0.0.1:8082/health
still says `ok`. Now run the reload command above and curl again.
Your task: make /health answer exactly `alive` — edit the return line to `return 200 "alive\n";`, save, reload.
File: ~/.k8s-wargame/nginx/app/conf.d/default.conf (any editor, e.g. `nano` or `code`). Apply: `docker exec wg-nginx nginx -s reload`.
Check yourself:  wg check      stuck?  wg hint
