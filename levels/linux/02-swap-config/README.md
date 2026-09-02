# mv renames, cp copies: order matters when a file gets replaced
Lesson: `mv SRC DST` gives a file a new name or a new place — nothing is copied, the same file just has a different path afterwards. `cp SRC DST` makes a second, independent file. Both silently overwrite DST if it already exists.
That overwrite is the trap. If the new file goes in first, the old content is gone and there is nothing left to back up. So the rule for any config rollout: look at both files, move the current one aside under a new name, then bring the new one in. Two commands, in that order.
`&&` chains commands so the second only runs if the first succeeded — useful exactly here, so a failed backup never leads to an overwrite.
    cat A B                  look at both files before touching anything
    mv old.conf old.bak      rename in place (same directory)
    cp new.conf old.conf     copy into place, overwriting
    ls -l /etc/dir           confirm what is there now
Try it first: `cd /tmp && echo a > f && mv f g && ls f g` — `f` is gone, `g` exists.
Your task: "The new config was uploaded to `/tmp/upload/app.conf.new`. Put it in place as `/etc/app/app.conf`. Keep the current one as `/etc/app/app.conf.bak` in case we need to roll back."
Goal: `/etc/app/app.conf` has the new content, `/etc/app/app.conf.bak` has the old content.
Check yourself:  wg check      stuck?  wg hint
