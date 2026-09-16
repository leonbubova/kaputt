## 1
A user has one primary group and any number of supplementary groups; `id bob` lists all of them. New group: `groupadd audit`. Membership of an existing user is changed with `usermod`, not by recreating the user.
## 2
`usermod -G LIST user` *replaces* the supplementary groups with LIST — that is how bob lost `dev`. `-a` (append) together with `-G` adds instead. Check with `id bob` after each step.
## 3
`groupadd audit && usermod -aG audit alice && usermod -aG audit bob`
