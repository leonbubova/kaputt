# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/linux/lib.sh"
s01(){ XS 'mkdir -p /srv/app/releases/1.4.2/conf && echo 1.4.2 > /srv/app/releases/1.4.2/VERSION'; }
s02(){ XS 'mv /etc/app/app.conf /etc/app/app.conf.bak && mv /tmp/upload/app.conf.new /etc/app/app.conf'; }
s03(){ XS 'find /var -name license.key > /answer'; }
s04(){ XS "grep -c '\" 500 ' /var/log/app/access.log > /answer"; }
s05(){ XS 'groupadd svc && useradd -m -g svc -s /bin/bash runner && chown runner:svc /srv/data'; }
s06(){ XS 'chown app:app /etc/app/db.conf && chmod 640 /etc/app/db.conf'; }
s07(){ XS "awk '{print \$1}' /var/log/app/access.log | sort | uniq -c | sort -rn | head -1 | awk '{print \$2}' > /answer"; }
s08(){ X chmod +x /opt/tools/healthcheck.sh; }
s09(){ X chmod 600 /etc/app/secret.key; }
s10(){ X chown -R app:app /var/log/app; }
s11(){ X sed -i 's/^workers=2$/workers=4/' /etc/app/app.conf; }
s12(){ X sed -i 's/\r$//' /usr/local/bin/report; }
s13(){ X ln -sfn /opt/app/releases/1.4.2 /opt/app/current; }
s14(){ X ln -sfn /etc/app/versions/config-v2.yml /etc/app/config.yaml; }
s15(){ XS 'echo "127.0.0.1 mock.internal" >> /etc/hosts'; }
s16(){ XS 'grep -v api.internal /etc/hosts > /tmp/h; cat /tmp/h > /etc/hosts; echo "127.0.0.1 api.internal" >> /etc/hosts'; }
s17(){ XS 'pkill -f /var/tmp/.x' || true; XD /opt/web/start.sh; sleep 1; }
s18(){ X rm -rf /var/lib/appdata/.cache; }
s19(){ X sed -i 's|^PATH=/opt/deploy/bin$|PATH="$PATH:/opt/deploy/bin"|' /home/deploy/.profile; }
s20(){ X sed -i 's/^APP_ENV=/export APP_ENV=/' /etc/profile.d/app-env.sh; }
s21(){ XS 'groupadd audit && usermod -aG audit alice && usermod -aG audit bob'; }
s22(){ X usermod -aG ops alice; }
s23(){ XS 'pkill -f kworkerd; rm -rf /usr/local/lib/.cache'; sleep 1; }
s24(){ XS "sed -i '/_proxy=/d' /etc/profile.d/zz-corp.sh; echo /etc/profile.d/zz-corp.sh > /answer"; }
s25(){ XS 'zcat /var/log/app/access.log.3.gz | wc -l > /answer'; }
s26(){ XS 'echo 2026-08-30T02:17:43Z > /answer'; }
s27(){ XS "echo '* * * * * root /opt/monitor/beat.sh' > /etc/cron.d/heartbeat"; }
s28(){ XS "sed -i 's|^\(\* \* \* \* \*\) /opt|\1 root /opt|' /etc/cron.d/backup; chmod +x /opt/backup/run.sh"; }
s29(){ X chmod 2775 /srv/share; }
