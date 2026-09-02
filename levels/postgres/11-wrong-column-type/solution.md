`user_id` was created as text; the app compares it with an integer → no operator, and even with a cast the index would be useless.
    alter table events alter column user_id type integer using user_id::integer;
