# durability audit: this instance isn't persisting writes to the AOF
The append-only file is disabled, so a crash loses recent writes. Turn AOF persistence on
at runtime (appendonly = yes).
