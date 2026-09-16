# a leaderboard endpoint
Ticket: "The game page needs `GET /rest/v1/leaderboard` (anon key): `name` and `score` of every player who is not banned, highest score first. Don't copy data around — it must always reflect `players`."
Goal: that request returns 200 with the 3 active players in score order; banned players never appear.
