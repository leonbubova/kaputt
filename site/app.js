const rot=["run it, break it, run it again.","from your first pod to draining a node.","one incident at a time."];
fetch('levels.json').then(r=>r.json()).then(d=>{
  document.getElementById('s-tracks').textContent=d.ntracks;
  document.getElementById('s-levels').textContent=d.total;
  const tt=document.getElementById('tt');let i=0;const spin=()=>{tt.textContent=rot[i%rot.length];i++};spin();setInterval(spin,3400);
  const grid=document.getElementById('grid');
  d.tracks.forEach(t=>{
    const el=document.createElement('div');el.className='tk';
    el.dataset.hay=(t.track+' '+t.blurb+' '+t.levels.map(l=>l.slug+' '+l.title).join(' ')).toLowerCase();
    const lis=t.levels.map((l,i)=>(i===0?'<li class="phase">learn — the concept first, hints free</li>':'')+(i===t.learn?'<li class="phase">test — tickets only, hints counted</li>':'')+`<li><span class="ln">${l.n}</span><span><span class="sl">${l.slug}</span><br>${l.title.replace(/</g,'&lt;')}</span></li>`).join('');
    el.innerHTML=`<h3>${t.track}<span class="n">${t.count}</span></h3><div class="bl">${t.blurb}</div>`+
      `<details><summary>show ${t.count} levels</summary><ol>${lis}</ol></details><div style="margin-top:12px;font-size:13px"><a href="tracks/${t.track}/index.html">track page →</a></div>`;
    grid.appendChild(el);
  });
  const q=document.getElementById('q');
  q.addEventListener('input',()=>{const v=q.value.toLowerCase().trim();
    document.querySelectorAll('.tk').forEach(c=>c.classList.toggle('hidden',v&&!c.dataset.hay.includes(v)));});
});
