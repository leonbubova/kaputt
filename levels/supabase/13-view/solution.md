    create view public.leaderboard as select name, score from public.players where not banned order by score desc;
