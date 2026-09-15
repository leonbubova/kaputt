## 1
A shell variable and an environment variable are not the same thing. `bash -lc 'echo $APP_ENV; env | grep APP_'`.
## 2
`APP_REGION` shows up in `env`, `APP_ENV` does not. Look at how each is set in `/etc/profile.d/app-env.sh`.
## 3
`export APP_ENV=production` — without `export`, child processes never see it.
