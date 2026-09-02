# give the staging mock a hostname on this box
Ticket: "The staging mock runs on this host at `127.0.0.1:9200`. The app is configured to call `http://mock.internal:9200/` and DNS will never know that name. Make it resolve here — on this box only, no DNS change."
Goal: inside the box, `curl http://mock.internal:9200/` prints `mock ok`.
