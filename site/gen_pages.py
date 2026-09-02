#!/usr/bin/env python3
"""Generate static SEO pages: one per track, one per level, plus sitemap.xml + robots.txt.
Reads the level READMEs straight from the repo (build time), so levels.json stays slim for the SPA.
Usage: gen_pages.py <repo-root> <site-dir> [public-base-url]
"""
import os, sys, re, glob, json, html, datetime

ROOT = sys.argv[1]; SITE = sys.argv[2]
BASE = (sys.argv[3] if len(sys.argv) > 3 else "https://leonbubova.github.io/kaputt").rstrip("/")
NAME = "kaputt"
data = json.load(open(os.path.join(SITE, "levels.json")))

def md_inline(s):
    s = html.escape(s)
    s = re.sub(r"`([^`]+)`", r"<code>\1</code>", s)
    s = re.sub(r"\*\*([^*]+)\*\*", r"<strong>\1</strong>", s)
    return s

def md_body(text):
    """tiny markdown: drop the H1; one line = one paragraph; 4-space-indented lines = command block; bullets; inline code/bold."""
    lines = [l.rstrip() for l in text.splitlines()]
    lines = [l for l in lines if not l.startswith("# ")]
    out, ul, pre = [], [], []
    def flush():
        nonlocal ul, pre
        if ul: out.append("<ul>" + "".join(f"<li>{md_inline(x)}</li>" for x in ul) + "</ul>"); ul = []
        if pre: out.append("<pre>" + html.escape("\n".join(pre)) + "</pre>"); pre = []
    for l in lines:
        if not l.strip(): flush(); continue
        if l.startswith("    "):
            if ul: flush()
            pre.append(l[4:]); continue
        if l.lstrip().startswith(("- ", "* ")):
            if pre: flush()
            ul.append(l.lstrip()[2:]); continue
        flush(); out.append("<p>" + md_inline(l.strip()) + "</p>")
    flush()
    return "\n".join(out)

def page(title, desc, body, depth, canonical):
    up = "../" * depth
    return f"""<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{html.escape(title)}</title>
<meta name="description" content="{html.escape(desc)}">
<link rel="canonical" href="{canonical}">
<meta property="og:title" content="{html.escape(title)}"><meta property="og:description" content="{html.escape(desc)}">
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;1,6..72,400;1,6..72,500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="{up}style.css?v=6">
<style>.crumbs{{color:var(--faint);font-size:13px;margin:36px 0 18px}}.crumbs a{{color:var(--muted)}}.crumbs a:hover{{color:var(--ink)}}
.meta{{color:var(--muted);font-size:14px;margin:-10px 0 28px}}.brief{{max-width:620px;font-size:17px;color:var(--ink)}}.brief p{{margin:0 0 16px}}
.lvls{{list-style:none;padding:0;margin:0;max-width:680px}}.lvls li{{border-top:1px solid var(--line);padding:12px 0;display:grid;grid-template-columns:34px 1fr;gap:12px}}
.lvls .ln{{color:var(--faint);font-variant-numeric:tabular-nums}}.lvls a{{color:var(--ink)}}.lvls a:hover{{color:var(--accent)}}.lvls .sl{{font-family:var(--mono);font-size:11px;color:var(--muted)}}
.pn{{display:flex;justify-content:space-between;gap:20px;margin-top:40px;font-size:14px}}.pn a{{color:var(--muted)}}.pn a:hover{{color:var(--ink)}}
h1.lvl{{font-size:clamp(30px,4.6vw,44px);line-height:1.15}}</style></head>
<body><div class="wrap">
<nav><a class="brand" href="{up}index.html" style="color:var(--ink)">{NAME}</a><div class="links"><a href="{up}tracks/index.html">all tracks</a><a href="{up}index.html#play">play</a></div></nav>
{body}
<footer class="foot"><a href="{up}index.html">home</a><a href="{up}tracks/index.html">all tracks & levels</a><a href="https://github.com/leonbubova/kaputt">github</a>
<div class="fine">{NAME} — a break/fix wargame. break it. fix it. understand it.</div></footer>
</div></body></html>"""

urls = []
def write(rel, content):
    p = os.path.join(SITE, rel); os.makedirs(os.path.dirname(p), exist_ok=True)
    open(p, "w").write(content); urls.append(f"{BASE}/{rel}".replace("/index.html", "/"))

tracks = data["tracks"]
# ---- tracks index
items = "".join(f'<li><span class="ln">{t["count"]}</span><span><a href="{t["track"]}/index.html">{t["track"]}</a><br><span class="sl">{html.escape(t["blurb"])}</span></span></li>' for t in tracks)
body = f'<div class="crumbs"><a href="../index.html">home</a> / tracks</div><h1 class="lvl">every track, every level</h1><p class="meta">{data["ntracks"]} tracks · {data["total"]} hands-on levels · beginner → pro</p><ul class="lvls">{items}</ul>'
write("tracks/index.html", page(f"all tracks — {NAME}", f"{data['total']} hands-on break/fix levels across {data['ntracks']} tracks: kubernetes, docker, linux, git, postgres, nginx and more.", body, 1, f"{BASE}/tracks/"))

for t in tracks:
    tr = t["track"]; lv = t["levels"]
    # ---- track page
    items = "".join(f'<li><span class="ln">{l["n"]}</span><span><a href="{l["n"]}-{l["slug"]}/index.html">{html.escape(l["title"])}</a><br><span class="sl">{l["slug"]}</span></span></li>' for l in lv)
    body = f'''<div class="crumbs"><a href="../../index.html">home</a> / <a href="../index.html">tracks</a> / {tr}</div>
<h1 class="lvl">{tr} <span class="it" style="font-style:italic;color:var(--accent)">— {html.escape(t["blurb"]).lower()}</span></h1>
<p class="meta">{t["count"]} levels · the first block builds the basics, then real incidents, easy → hard</p>
<pre class="term"><span class="c"># play this track</span>
wg track {tr}
wg help          <span class="c"># the ~10 commands you'll need</span>
wg level 1</pre>
<ul class="lvls" style="margin-top:28px">{items}</ul>'''
    write(f"tracks/{tr}/index.html", page(f"{tr} track — {t['count']} break/fix levels — {NAME}", f"Learn {tr} by fixing broken systems: {t['count']} hands-on levels, beginner to pro. {t['blurb']}.", body, 2, f"{BASE}/tracks/{tr}/"))
    # ---- level pages
    for i, l in enumerate(lv):
        d = os.path.join(ROOT, "levels", tr, f"{l['n']}-{l['slug']}")
        readme = open(os.path.join(d, "README.md")).read() if os.path.exists(os.path.join(d, "README.md")) else ""
        brief = md_body(readme)
        prev = lv[i-1] if i > 0 else None; nxt = lv[i+1] if i+1 < len(lv) else None
        pn = '<div class="pn">' + (f'<a href="../{prev["n"]}-{prev["slug"]}/index.html">← {html.escape(prev["title"])}</a>' if prev else "<span></span>") + (f'<a href="../{nxt["n"]}-{nxt["slug"]}/index.html">{html.escape(nxt["title"])} →</a>' if nxt else "<span></span>") + "</div>"
        body = f'''<div class="crumbs"><a href="../../../index.html">home</a> / <a href="../../index.html">tracks</a> / <a href="../index.html">{tr}</a> / level {l["n"]}</div>
<h1 class="lvl">{html.escape(l["title"])}</h1>
<p class="meta">{tr} · level {l["n"]} of {t["count"]} · <code>{l["slug"]}</code></p>
<div class="brief"><h2>the ticket</h2>{brief}</div>
<h2 style="margin-top:36px">play it</h2>
<pre class="term"><span class="c"># in your terminal, after ./install.sh</span>
wg track {tr}
wg level {int(l["n"])}
<span class="c"># investigate with the real tools, fix it, then</span>
wg check        <span class="c"># green = solved · stuck? wg hint</span></pre>
<p class="meta" style="margin-top:22px">you get three escalating hints, then the full solution — and the level resets clean so you can repeat it until it's muscle memory. <a href="https://github.com/leonbubova/kaputt/tree/master/levels/{tr}/{l["n"]}-{l["slug"]}">level source on github</a>.</p>
{pn}'''
        desc = f"{tr} exercise: {l['title']}. Fix a real broken {tr} system in your own terminal — level {l['n']} of {t['count']}, with hints and a checker."
        write(f"tracks/{tr}/{l['n']}-{l['slug']}/index.html", page(f"{html.unescape(l['title'])} — {tr} level {l['n']} — {NAME}", desc, body, 3, f"{BASE}/tracks/{tr}/{l['n']}-{l['slug']}/"))

# ---- sitemap + robots
today = datetime.date.today().isoformat()
sm = '<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n' + f"<url><loc>{BASE}/</loc><lastmod>{today}</lastmod></url>\n" + "".join(f"<url><loc>{u}</loc><lastmod>{today}</lastmod></url>\n" for u in urls) + "</urlset>\n"
open(os.path.join(SITE, "sitemap.xml"), "w").write(sm)
open(os.path.join(SITE, "robots.txt"), "w").write(f"User-agent: *\nAllow: /\nSitemap: {BASE}/sitemap.xml\n")
print(f"generated {len(urls)} pages + sitemap ({len(urls)+1} urls)")
