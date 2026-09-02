Two causes: cron.d entry lacks the user field, and the script has no execute bit.
    sed -i 's|^\(\* \* \* \* \*\) /opt|\1 root /opt|' /etc/cron.d/backup; chmod +x /opt/backup/run.sh
