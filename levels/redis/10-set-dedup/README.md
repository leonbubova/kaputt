# the tag list has duplicates — it should be a unique set
`tags` was built as a list and now contains duplicate entries. It should be a Redis set
with exactly the unique members: red, green, blue.
