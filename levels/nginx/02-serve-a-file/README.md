# serving a file: the html folder
Lesson: the simplest thing a web server does is hand out files. nginx has one folder it serves from — its root.
A request for /style.css gets the file style.css from that folder; /hello.txt would get hello.txt. Yours is on
your machine at `~/.k8s-wargame/nginx/app/html/` (nginx sees the same folder from inside its box). Files need
no restart, no reload: put a file there, and the next request finds it.
Try it:
    ls ~/.k8s-wargame/nginx/app/html
    curl -H 'Host: shop.local' http://127.0.0.1:8082/style.css
The answer is exactly the content of style.css in that folder.
Your task: create a file `hello.txt` in `~/.k8s-wargame/nginx/app/html/` containing the text  hello from nginx
(lesson 1 of the shell track: `echo … > file`). Then confirm: `curl -H 'Host: shop.local' http://127.0.0.1:8082/hello.txt`
must print `hello from nginx`.
Work in ~/.k8s-wargame/nginx/app/html/ in your normal terminal.
Check yourself:  wg check      stuck?  wg hint
