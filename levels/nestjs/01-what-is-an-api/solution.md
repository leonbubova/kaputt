The API runs in terminal 1 (`npm run start:dev`); in terminal 2 curl's answer goes into the file:
    curl -s localhost:3200/users/1 > ~/.k8s-wargame/nestjs/app/answer.txt
