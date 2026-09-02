#!/usr/bin/env bash
# regenerate levels.json from the wargame repo's committed tracks
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
WARGAME=${1:-$HERE/..}
python3 - "$WARGAME" > "$HERE/levels.json" <<'PY'
import os,sys,json,glob
root=os.path.join(sys.argv[1],'levels')
BLURB={
 'shell':'The terminal from zero — for absolute beginners',
 'k8s':'Kubernetes on a real 3-node cluster','helm':'Package and release with Helm',
 'docker':'Containers, images, compose','linux':'The command line and a broken box',
 'git':'Version control, recovery, history surgery','nginx':'Reverse proxy and web server',
 'postgres':'SQL, schema, performance','redis':'Keys, queues, eviction',
 'networking':'DNS, ports, routes, firewalls','tls':'Certificates and openssl',
 'nextjs':'Next.js 15 App Router','nestjs':'NestJS dependency injection and HTTP',
 'trigger':'Trigger.dev background tasks','supabase':'Postgres, RLS, auth, storage',
 'systemd':'Units, services, timers','terraform':'Infrastructure as code',
 'bash':'Shell scripting gotchas','pentest':'Find and fix web-app vulnerabilities (defensive)',
 'ci':'GitHub Actions','ansible':'Configuration management',
}
def firstline(p):
    try:
        for l in open(p):
            l=l.strip()
            if l.startswith('# '): return l[2:].strip()
            if l: return l
    except Exception: pass
    return ''
tracks=[]
for td in sorted(glob.glob(root+'/*/')):
    name=os.path.basename(td.rstrip('/'))
    if not os.path.exists(os.path.join(td,'track.sh')): continue
    lvls=[]
    learn=None
    for l in open(os.path.join(td,'track.sh')):
        if l.startswith('LEARN_LEVELS='): learn=int(l.split('=')[1].split()[0])
    for ld in sorted(glob.glob(td+'[0-9]*/')):
        slug=os.path.basename(ld.rstrip('/'))
        lvls.append({'n':slug[:2],'slug':slug[3:],'title':firstline(os.path.join(ld,'README.md'))})
    if learn is None: learn=(len(lvls)+1)//2
    for i,l in enumerate(lvls): l['learn']=i<learn
    if lvls: tracks.append({'track':name,'blurb':BLURB.get(name,''),'count':len(lvls),'learn':learn,'levels':lvls})
json.dump({'tracks':tracks,'total':sum(t['count'] for t in tracks),'ntracks':len(tracks)},sys.stdout,indent=1)
PY
echo "wrote levels.json: $(python3 -c "import json;d=json.load(open('$HERE/levels.json'));print(d['ntracks'],'tracks',d['total'],'levels')")"
# static SEO pages: one per track + one per level + sitemap (reads level READMEs from the repo)
python3 "$HERE/gen_pages.py" "$WARGAME" "$HERE" "${SITE_BASE_URL:-https://leonbubova.github.io/kaputt}"
