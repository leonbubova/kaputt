The file was committed before the ignore rule existed; ignore rules don't apply to tracked files.
    git rm --cached build/out.log && git commit -m "Stop tracking build output"
