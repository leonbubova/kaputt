`/etc/profile.d/zz-corp.sh` exports `http_proxy`/`https_proxy` to the dead proxy.
    sed -i '/_proxy=/d' /etc/profile.d/zz-corp.sh; echo /etc/profile.d/zz-corp.sh > /answer
