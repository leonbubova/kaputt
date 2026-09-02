# security review: /api/ accepts request bodies far too large
Anything posted to /api/ is forwarded to the backend up to 10 MB; the upload service never needs more than 500 KB.
Cap request bodies on the /api/ location at 512k so bigger uploads are rejected at the edge with 413.
A 200 KB upload to /api/upload must still go through.
