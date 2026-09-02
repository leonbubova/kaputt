# medium uploads fail with 413 Request Entity Too Large
Users report the image uploader rejects anything but very small files.
The upload goes through /api/upload to the backend, which accepts bodies up to 1 MB.
nginx at the edge is rejecting them first. Raise the edge limit so those uploads get through.
