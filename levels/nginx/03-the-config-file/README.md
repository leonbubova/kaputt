# the config file: server and location
Lesson: everything nginx does that is not "hand out a file" is written in its config file. Yours is
`~/.k8s-wargame/nginx/app/conf.d/default.conf`. It is plain text with two kinds of blocks, braces `{ }` around each:
    server {                         one site. server_name says which Host names belong to it.
        listen 80;                   the port it answers on
        root /usr/share/nginx/html;  the folder from lesson 2, as nginx sees it inside its box
        location = /health {         one path. "= /health" means exactly that path.
            return 200 "ok\n";       the fixed answer for it: status 200 and the text
        }
        location /api/ { ... }       "/api/" without = means: every path starting with /api/
    }
Every setting line ends with `;`. A request first picks the server by Host name, then the best-matching location,
then does what that location says. If no location fits, `location /` catches it.
Try it:
    cat ~/.k8s-wargame/nginx/app/conf.d/default.conf
Find the `location = /health` block — it is why lesson 1's /health answered `ok`. Find `location = /new` too.
Your task: list all location lines of the file with their line numbers into a notes file:
    grep -n location ~/.k8s-wargame/nginx/app/conf.d/default.conf > ~/.k8s-wargame/nginx/notes/locations.txt
Read the result: five blocks, five paths. Just reading — nothing changes.
Check yourself:  wg check      stuck?  wg hint
