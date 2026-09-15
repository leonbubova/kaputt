source ../../../lib/common.sh; source ../lib.sh
site 'listen 8080;'
XD sh -c 'nc -lk 8080'
sleep 1
