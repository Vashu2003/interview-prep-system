async function loadAnalytics() {
  const response = await fetch('../data/analytics.json', { cache: 'no-store' });
  if (!response.ok) {
    throw new Error(`Unable to load analytics: ${response.status}`);
  }
  return response.json();
}

function text(id, value) {
  document.getElementById(id).textContent = value;
}

function list(id, items, fallback) {
  const node = document.getElementById(id);
  node.innerHTML = '';

  if (!items || items.length === 0) {
    const li = document.createElement('li');
    li.textContent = fallback;
    node.appendChild(li);
    return;
  }

  items.forEach((item) => {
    const li = document.createElement('li');
    li.textContent = typeof item === 'string'
      ? item
      : `${item.date || 'unknown'} - ${item.energy || 'unknown'} - ${item.topic || 'untitled'}`;
    node.appendChild(li);
  });
}

function renderSessions(sessions) {
  const tbody = document.getElementById('sessionRows');
  tbody.innerHTML = '';

  if (!sessions || sessions.length === 0) {
    const tr = document.createElement('tr');
    const td = document.createElement('td');
    td.colSpan = 6;
    td.textContent = 'No sessions logged yet.';
    tr.appendChild(td);
    tbody.appendChild(tr);
    return;
  }

  sessions.slice().reverse().forEach((session) => {
    const tr = document.createElement('tr');
    [
      session.date || '',
      session.mode || '',
      session.topic || '',
      session.energy || '',
      String(session.quality_score ?? 0),
      session.revision_done ? 'yes' : 'no',
    ].forEach((value) => {
      const td = document.createElement('td');
      td.textContent = value;
      tr.appendChild(td);
    });
    tbody.appendChild(tr);
  });
}

function render(data) {
  text('generatedAt', data.generated_at ? `Generated ${data.generated_at}` : 'Not generated yet');
  text('readinessValue', `${data.interview_readiness_percentage || 0}%`);
  text('sessionsAttempted', data.sessions_attempted || 0);
  text('streakDays', data.streak_days || 0);
  text('averageQuality', data.average_quality_score || 0);
  text('revisionFrequency', `${data.revision_frequency || 0}%`);
  text('gitCommitCount', data.git_commit_count || 0);

  const core = data.mode_split?.['Core Interview Readiness'] || 0;
  const broad = data.mode_split?.['Broad Concept Coverage'] || 0;
  const total = Math.max(core + broad, 1);
  document.getElementById('coreBar').style.width = `${(core / total) * 100}%`;
  document.getElementById('broadBar').style.width = `${(broad / total) * 100}%`;
  text('coreCount', core);
  text('broadCount', broad);

  list('weakTopics', data.weak_topics, 'No weak topics scored yet.');
  list('topicsCovered', data.topics_covered, 'No topics covered yet.');
  list('energyTrend', data.energy_trend, 'No energy data yet.');
  renderSessions(data.sessions);
}

loadAnalytics()
  .then(render)
  .catch((error) => {
    document.body.innerHTML = `<main><section class="panel"><h1>Dashboard Error</h1><p>${error.message}</p><p>Run the analytics generator first.</p></section></main>`;
  });
