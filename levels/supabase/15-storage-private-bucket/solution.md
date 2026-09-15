Bucket `avatars` was created private; `/object/public/` requires `public = true`.
    update storage.buckets set public = true where id = 'avatars';
