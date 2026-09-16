## 1
The path in the URL is the file name inside the root folder. /hello.txt = the file hello.txt in ~/.k8s-wargame/nginx/app/html/.
## 2
Create the file with `echo hello from nginx > FILE`, where FILE is the full path of hello.txt inside that html folder.
## 3
    echo hello from nginx > ~/.k8s-wargame/nginx/app/html/hello.txt
    curl -H 'Host: shop.local' http://127.0.0.1:8082/hello.txt
