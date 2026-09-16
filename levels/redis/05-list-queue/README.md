# a list as a queue: RPUSH and LPOP
Lesson: a *list* is a value that holds several items in order — a line of people. Items go in at one end and
come out at the other; that is a queue. Commands (L = left end / head, R = right end / tail):
    RPUSH inbox mail4         append at the right end. Answers the new length.
    LRANGE inbox 0 -1         show all items, first to last (0 = first item, -1 = last item)
    LPOP inbox                take the first item off the left end and return it — it is now gone from the list
So `RPUSH` adds work at the back, `LPOP` takes the oldest item from the front. The order you pushed is the
order `LRANGE` shows and the order `LPOP` hands out.
Try it:
    wg shell
    RPUSH demo:q a b c
    LRANGE demo:q 0 -1
    LPOP demo:q
    LRANGE demo:q 0 -1
Your task: the list `inbox` holds mail1, mail2, mail3. Take ONE item off the front (mail1 has been handled)
and append a new item `mail4` at the back. Afterwards `LRANGE inbox 0 -1` must show exactly: mail2, mail3, mail4.
Where: inside `wg shell`.
Check yourself:  wg check      stuck?  wg hint
