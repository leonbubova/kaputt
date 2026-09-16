## 1
`DELETE FROM table WHERE …` removes exactly the rows the WHERE matches — and every row if you leave the WHERE off. Look first: `select * from users;` — which rows have role `tester`?
## 2
Write the WHERE as a SELECT first and check it returns only what should go: `select * from users where role = 'tester';` Then swap `select *` for `delete`.
## 3
`delete from users where role = 'tester';` — then `select * from users;` shows the 4 real users.
