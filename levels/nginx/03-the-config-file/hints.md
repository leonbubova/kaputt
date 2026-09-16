## 1
A `location` block is one path and what to do with it. `grep -n WORD FILE` prints every line containing WORD, with its line number.
## 2
The file is ~/.k8s-wargame/nginx/app/conf.d/default.conf; the notes folder from lesson 1 is ~/.k8s-wargame/nginx/notes/ (mkdir -p it if it is gone).
## 3
    mkdir -p ~/.k8s-wargame/nginx/notes
    grep -n location ~/.k8s-wargame/nginx/app/conf.d/default.conf > ~/.k8s-wargame/nginx/notes/locations.txt
