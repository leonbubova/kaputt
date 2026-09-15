# the deploy counter wasn't bumped for tonight's release
Every release increments the integer key `deploy:count` by exactly one. Tonight's deploy script
crashed before it got to that step. Bump the counter once — don't guess or hard-code the number.
