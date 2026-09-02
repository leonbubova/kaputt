# a list keeps order: push onto an end, read by index
Lesson: sets of fields are fine for a record, but a queue needs order — first job in, first job out. A Redis list is an ordered sequence of strings where every element keeps the position it was inserted at.
You choose which end to push onto. `RPUSH` appends to the tail (right), so pushing a, b, c in that order gives index 0 = a. `LPUSH` prepends to the head (left) and reverses that. For a queue that workers consume from the front, appending to the tail keeps the natural order.
Indexes count from 0; negative indexes count from the end, so `-1` is the last element. `LRANGE key 0 -1` therefore means "everything".
    RPUSH queue:jobs a b c     append to the tail, in the given order
    LPUSH queue:jobs x         prepend to the head — x becomes index 0
    LRANGE queue:jobs 0 -1     read the whole list, head to tail
    LLEN queue:jobs            how many elements
Try it first: `LRANGE queue:jobs 0 -1` — empty. Then `TYPE queue:jobs` says `none`: an empty list is no list at all.
Your task: workers pop jobs off the list `queue:jobs`. Seed it, in order, with: build, test, deploy (index 0 = build).
Check yourself:  wg check      stuck?  wg hint
