# the events feed is broken: LPUSH returns WRONGTYPE
The app appends to the list `events`, but the key was created as a plain string, so every
push fails with WRONGTYPE. It should be a list holding: signup, login (index 0 = signup).
