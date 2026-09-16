# count the words of a comment
Ticket: "`comments` has a `word_count` column that the frontend shows. Fill it in the database: every new comment (`POST /rest/v1/comments` with `{"body":"…"}`, service key) must get `word_count` = number of whitespace-separated words in `body` — the client sends nothing but the body."
Goal: after the POST the stored row has the right `word_count`.
