# keep the notes when the container is replaced
"Whatever we save in the `notes` container is gone after every upgrade." Goal: a named volume `wg-notes` mounted at `/notes` in a running container `wg-notes` (`alpine:3.20`), containing a file `/notes/hello.txt` with the text `keep me` — and that file must still be there after `docker rm -f wg-notes` and a fresh container with the same volume.
