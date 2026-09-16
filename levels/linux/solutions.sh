# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/linux/lib.sh"
s01(){ XS 'echo hello > /root/i-am-in.txt'; }
s02(){ XS "su - alice -c 'echo hi > /home/alice/note.txt'"; }
s03(){ X chown alice:dev /srv/notes/todo.txt; }
s04(){ X chmod 644 /srv/notes/plan.txt; }
s05(){ X pkill -f /opt/tick/tick.sh; sleep 1; }
s06(){ XS 'grep ERROR /var/log/app/app.log > /answer'; }
s07(){ XS 'echo cache > /answer'; }
s08(){ XS "echo '* * * * * root /opt/hello/say.sh' > /etc/cron.d/hello"; }
s09(){ XS 'mkdir -p /srv/app/releases/1.4.2/conf && echo 1.4.2 > /srv/app/releases/1.4.2/VERSION'; }
s10(){ XS 'mv /etc/app/app.conf /etc/app/app.conf.bak && mv /tmp/upload/app.conf.new /etc/app/app.conf'; }
s11(){ XS 'find /var -name license.key > /answer'; }
s12(){ XS "grep -c '\" 500 ' /var/log/app/access.log > /answer"; }
s13(){ XS 'groupadd svc && useradd -m -g svc -s /bin/bash runner && chown runner:svc /srv/data'; }
s14(){ XS 'chown app:app /etc/app/db.conf && chmod 640 /etc/app/db.conf'; }
s15(){ XS "awk '{print \$1}' /var/log/app/access.log | sort | uniq -c | sort -rn | head -1 | awk '{print \$2}' > /answer"; }
s16(){ X chmod +x /opt/tools/healthcheck.sh; }
s17(){ X chmod 600 /etc/app/secret.key; }
s18(){ X chown -R app:app /var/log/app; }
s19(){ X sed -i 's/^workers=2$/workers=4/' /etc/app/app.conf; }
s20(){ X sed -i 's/\r$//' /usr/local/bin/report; }
s21(){ X ln -sfn /opt/app/releases/1.4.2 /opt/app/current; }
s22(){ X ln -sfn /etc/app/versions/config-v2.yml /etc/app/config.yaml; }
s23(){ XS 'echo "127.0.0.1 mock.internal" >> /etc/hosts'; }
s24(){ XS 'grep -v api.internal /etc/hosts > /tmp/h; cat /tmp/h > /etc/hosts; echo "127.0.0.1 api.internal" >> /etc/hosts'; }
s25(){ XS 'pkill -f /var/tmp/.x' || true; XD /opt/web/start.sh; sleep 1; }
s26(){ X rm -rf /var/lib/appdata/.cache; }
s27(){ X sed -i 's|^PATH=/opt/deploy/bin$|PATH="$PATH:/opt/deploy/bin"|' /home/deploy/.profile; }
s28(){ X sed -i 's/^APP_ENV=/export APP_ENV=/' /etc/profile.d/app-env.sh; }
s29(){ XS 'groupadd audit && usermod -aG audit alice && usermod -aG audit bob'; }
s30(){ X usermod -aG ops alice; }
s31(){ XS 'pkill -f kworkerd; rm -rf /usr/local/lib/.cache'; sleep 1; }
s32(){ XS "sed -i '/_proxy=/d' /etc/profile.d/zz-corp.sh; echo /etc/profile.d/zz-corp.sh > /answer"; }
s33(){ XS 'zcat /var/log/app/access.log.3.gz | wc -l > /answer'; }
s34(){ XS 'echo 2026-08-30T02:17:43Z > /answer'; }
s35(){ XS "echo '* * * * * root /opt/monitor/beat.sh' > /etc/cron.d/heartbeat"; }
s36(){ XS "sed -i 's|^\(\* \* \* \* \*\) /opt|\1 root /opt|' /etc/cron.d/backup; chmod +x /opt/backup/run.sh"; }
s37(){ X chmod 2775 /srv/share; }
