# the newsletter sends twice to some people
"`subscribers` has people in it two or three times — the signup form just inserts. Marketing wants it cleaned up *and* impossible to happen again: a repeated `POST /rest/v1/subscribers` for an existing email must be rejected." Goal: no duplicate emails, every existing subscriber (5 people) is kept, repeat signup → `409`.
