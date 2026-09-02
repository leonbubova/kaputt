## 1
Ask the planner: `explain analyze select * from page_views where user_id = 42;` — a `Seq Scan` over 300k rows is your answer.
## 2
What indexes exist? `\d page_views` — only the primary key. The filter column is `user_id`.
## 3
`create index page_views_user_id_idx on public.page_views (user_id);` then re-run `explain`.
