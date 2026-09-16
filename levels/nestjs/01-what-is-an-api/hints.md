## 1
Two terminals: terminal 1 runs the API (`npm run start:dev`, it keeps running), terminal 2 sends requests with `curl`. Without the running API, curl gets nothing.
## 2
`curl -s localhost:3200/users/1` prints the answer on the screen. Add `> ~/.k8s-wargame/nestjs/app/answer.txt` to the end of that line to put it into the file instead.
## 3
    cd ~/.k8s-wargame/nestjs/app
    npm run start:dev                                                        # terminal 1, leave it running
    curl -s localhost:3200/users/1 > ~/.k8s-wargame/nestjs/app/answer.txt   # terminal 2
