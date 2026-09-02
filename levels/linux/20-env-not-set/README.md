# app says APP_ENV is not set, but /etc/profile.d sets it
"`/opt/app/env-check` complains `APP_ENV not set`. Yet `grep APP_ENV /etc/profile.d/*` finds it, and `echo $APP_ENV` in a login shell prints `production`. `APP_REGION` from the same file works fine."
Goal: `bash -lc /opt/app/env-check` prints `env=production`. Fix it in the profile, not in the script.
