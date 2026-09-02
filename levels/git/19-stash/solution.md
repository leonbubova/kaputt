    git stash && git switch main && echo 1.4.1 > VERSION && git commit -am "Bump version to 1.4.1"
    git switch feature/report && git stash pop
