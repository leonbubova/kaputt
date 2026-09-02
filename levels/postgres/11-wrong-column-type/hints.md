## 1
Run the query yourself: `operator does not exist: text = integer`. `\d events` — what type is `user_id`? The app compares it with a number.
## 2
The import created `user_id` as `text`. Changing the column type fixes the query and the index at once: `ALTER TABLE … ALTER COLUMN … TYPE integer USING …`.
## 3
`alter table events alter column user_id type integer using user_id::integer;` — then `explain select count(*) from events where user_id = 4242;` shows the index.
