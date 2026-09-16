source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /opt/local-svc; echo "local ok" > /opt/local-svc/index.html
cat > /etc/profile.d/zz-corp.sh <<'P'
# corporate baseline (managed) — do not edit
umask 022
export http_proxy=http://proxy.old.corp:3128
export https_proxy=http://proxy.old.corp:3128
P
echo '# proxy settings are managed centrally, see /etc/profile.d' >> /etc/skel/.bashrc
echo '# Acquire::http::Proxy "http://proxy.new.corp:3128";' > /etc/apt/apt.conf.d/99proxy
IN
XD python3 -m http.server 9300 --bind 127.0.0.1 --directory /opt/local-svc
sleep 1
