# nginx won't come up after a hand edit of default.conf
Someone edited the TLS config by hand and restarted the edge; now the container exits right
after starting and the site is down. The intended config is correct, only a typo slipped in.
Find out what nginx complains about, fix that line (don't delete it) and bring the edge back.
