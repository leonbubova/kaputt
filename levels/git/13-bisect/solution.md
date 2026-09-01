    git bisect start HEAD $(git rev-list --max-parents=0 HEAD) && git bisect run ./test.sh
    git rev-parse refs/bisect/bad > ~/.k8s-wargame/git/answer && git bisect reset
