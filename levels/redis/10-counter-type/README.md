# the view counter is stuck — INCR page:views fails
`page:views` should be an integer the app bumps with INCR, but it currently holds
non-numeric text, so INCR errors out. Reset it to a whole number so INCR works again.
