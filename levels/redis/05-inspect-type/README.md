# the migration audit needs to know what kind of value `legacy:blob` holds
Nobody remembers what data type the old key `legacy:blob` was created with, and the migration
script refuses to guess. Look it up and record the exact type name (as Redis reports it) as a
string under `audit:legacy:type`. Leave `legacy:blob` untouched.
