# changing a row — UPDATE … WHERE
Lesson: UPDATE changes values in rows that already exist. You say which table, which column gets which new
value, and — with WHERE — which rows:
    update pets set age = 4 where name = 'Rex';
The WHERE is the same as in SELECT. Leave it off and EVERY row gets the new value — the classic database
accident. Safe habit: run the WHERE as a SELECT first, look at the rows it returns, then run the UPDATE with the
identical WHERE. Postgres answers `UPDATE 1`: that many rows changed. If it says `UPDATE 8`, you forgot the WHERE.
Try it:
    wg shell
    select * from pets where name = 'Rex';
    update pets set age = 4 where name = 'Rex';
    select * from pets where name = 'Rex';
Your task: `Bella` is stored with age 2, but she is 6. Change her age to 6. Nothing else in the table may change.
Check yourself:  wg check      stuck?  wg hint
