# one waitlist spot per email
Ticket: "The waitlist form does `POST /rest/v1/waitlist` with `{"email":"…"}` (anon key). People click twice and land on the list twice. Make the database refuse a second row for the same email — a repeat POST must answer `409`. Keep the 3 people already on the list."
Goal: duplicate email → 409; the 3 existing rows stay.
