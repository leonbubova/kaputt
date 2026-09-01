    git fsck --unreachable | grep commit       # find the dangling stash commit
    git stash apply <hash>
