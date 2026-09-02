# postgres — the SQL you'll actually use
  \dt  \d <table>  \di               list tables / describe one / list indexes   (psql meta-commands)
  SELECT … FROM t WHERE … ORDER BY … LIMIT n
  INSERT INTO t (cols) VALUES (…)
  UPDATE t SET col=val WHERE …       (never forget the WHERE)
  CREATE INDEX idx ON t (col)        make a WHERE/JOIN on col fast
  EXPLAIN (ANALYZE) SELECT …         is it using the index? (Index Scan vs Seq Scan)
  ALTER TABLE t ADD CONSTRAINT … UNIQUE (col) / FOREIGN KEY (c) REFERENCES o(id)
  GRANT SELECT ON t TO role          permissions
  SELECT * FROM pg_stat_activity     who's connected / what's blocked

Mental model: constraints protect data (UNIQUE, FK, CHECK); indexes make queries fast. "Slow query" → EXPLAIN. "Duplicate rows" → missing UNIQUE.
