# writes /var/log/app/access.log — 600 deterministic lines, run inside the box
mkdir -p /var/log/app
awk 'BEGIN{
  split("10.0.0.7 10.0.0.12 10.0.0.3 172.16.4.9 192.168.9.21 10.0.0.44",ip," ");
  split("200 200 200 200 200 301 404 200 500 200 200 403 200 200 500 200 200 200 200 502",st," ");
  split("/ /api/v1/orders /api/v1/users /health /static/app.js /login",pth," ");
  for(i=1;i<=600;i++){
    w=(i*7)%23; c=(w<9)?1:(w<13)?2:(w<16)?3:(w<19)?4:(w<21)?5:6;
    printf "%s - - [01/Sep/2026:%02d:%02d:%02d +0000] \"GET %s HTTP/1.1\" %s %d\n", ip[c], (i/25)%24, (i*3)%60, (i*11)%60, pth[(i*5)%6+1], st[(i*13)%20+1], 200+(i*37)%900 }}' > /var/log/app/access.log
