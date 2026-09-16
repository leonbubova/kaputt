## 1
Two lines in the file: the shebang, then the echo. Then one command in the terminal to allow running it. `ls -l run-me.sh` shows an `x` in the left column once it is allowed.
## 2
The file:
    #!/usr/bin/env bash
    echo it runs
Then `chmod +x run-me.sh` and `./run-me.sh`.
## 3
    cd ~/.k8s-wargame/bash/work
    printf '#!/usr/bin/env bash\necho it runs\n' > run-me.sh
    chmod +x run-me.sh
    ./run-me.sh
