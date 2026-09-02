# the profile page takes seconds
"`GET /rest/v1/page_views?user_id=eq.42` is dog slow (hundreds of ms and getting worse as the table grows — 300k rows now). Same query on other tables is instant." Goal: that query is served with an index, without deleting any data.
