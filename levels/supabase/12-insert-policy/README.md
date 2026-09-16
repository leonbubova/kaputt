# let visitors add notes
Ticket: "Anonymous visitors can read `notes` now. Next: the note form. `POST /rest/v1/notes` with `{"body":"…"}` and the anon key must create a row. Reading stays as it is, RLS stays on, and visitors still must not delete anything."
Goal: anon POST returns 201 and the row is stored; anon DELETE changes nothing.
