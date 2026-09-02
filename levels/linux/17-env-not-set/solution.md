`APP_ENV=production` is set but not exported — child processes don't inherit it.
    sed -i 's/^APP_ENV=/export APP_ENV=/' /etc/profile.d/app-env.sh
