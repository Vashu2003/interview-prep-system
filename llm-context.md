# LLM Context Bundle

Generated: 2026-07-27T23:10:59

Purpose: single startup context file for LLM-run interview-prep sessions.

## LLM Session Protocol

Source: `LLM_SESSION_PROTOCOL.md`

# LLM Session Protocol

This repo is used by an LLM to run interview-prep sessions.

## Required Startup Context

Before starting a session, the LLM must read:

1. `llm-context.md`
2. `README.md`
3. The latest session file in `sessions/`
4. `context/PROFILE.md`

`llm-context.md` is generated from the repo Markdown files and repo-local context snapshots. Regenerate it after important edits.

This repo must remain portable. Do not depend on absolute local paths such as `C:/Users/...` during normal operation. Use files under `context/` instead.

## Session Rules

- Ask one question at a time.
- Adapt depth to energy: `low`, `medium`, or `high`.
- Start with a 5-10 minute revision of important Core topics.
- Teach the selected concept before grilling.
- Grill moderately: correct weak answers and ask follow-ups, but do not turn the session into punishment.
- Every attempt counts as a session, even weak or incomplete attempts.
- Each attempt must produce a new Markdown file under `sessions/`.
- Every attempt should be committed and pushed to GitHub.

## Mode Rules

### Core Interview Readiness

Use this when the session is about being interview-ready from `context/PROFILE.md`.

Primary focus:
- resume/profile claim defense
- project defense
- likely interview questions
- answer quality
- follow-up handling

### Broad Concept Coverage

Use this when the session is about useful full-stack knowledge outside the main profile-defense path.

Primary focus:
- full-stack concepts
- backend/frontend/database/system basics
- practical examples
- breadth without drifting away from full-stack development

## Session Output Requirements

At the end of every session:

1. Create or update one session Markdown file.
2. Include YAML metadata.
3. Record what was taught.
4. Record grill questions and answer quality.
5. Record weak spots.
6. Record next actions.
7. Run analytics generation.
8. Commit and push.

## Scoring

Quality score:
- 0: started but no meaningful answer
- 1: vague recognition
- 2: basic answer with gaps
- 3: acceptable interview answer
- 4: strong answer with examples
- 5: strong answer with implementation detail, tradeoffs, metrics, and follow-up resilience

## LLM Handoff

Source: `LLM_HANDOFF.md`

# LLM Handoff

This repository is portable. An LLM should be able to continue the interview-prep system from the GitHub repo alone.

Repository:

```text
https://github.com/Vashu2003/interview-prep-system
```

## Start Here

Read these files in order:

1. `LLM_HANDOFF.md`
2. `LLM_SESSION_PROTOCOL.md`
3. `llm-context.md`
4. Latest file in `sessions/`

Do not require access to `C:/Users/...` paths. Repo-local context snapshots live in `context/`.

## Source Files

- `context/PROFILE.md` - current profile/resume source of truth
- `context/recovered-interview-prep-tracker.md` - rebuilt tracker from recovered files
- `context/LEAN_TRACK.md` - recovered high-yield prioritization
- `context/interview-prep-nextalphaai-bairesdev.md` - role-specific prep notes
- `topics/` - Core and Broad topic catalogs
- `sessions/` - one Markdown file per attempted session

## How To Continue

For every session:

1. Ask for energy: `low`, `medium`, or `high`.
2. Pick mode: `Core Interview Readiness` or `Broad Concept Coverage`.
3. Do a short revision of Core topics.
4. Teach the topic.
5. Grill moderately after teaching.
6. Write a new Markdown file under `sessions/`.
7. Run analytics generation if tools are available.
8. Rebuild `llm-context.md` if tools are available.
9. Commit and push changes if GitHub write access is available.

If tools are unavailable, output the exact Markdown patch needed for the user to apply.

## Important Behavior

- One question at a time.
- Every attempt counts, even incomplete or weak sessions.
- Do not skip logging because the session was low energy.
- Keep grilling moderate while the user is rebuilding knowledge.
- The main goal is interview readiness from `context/PROFILE.md`.

## Repo README

Source: `README.md`

# Interview Prep System

Markdown-first interview preparation system for Vashu Singh.

## Purpose

This repo tracks every interview-prep attempt, even weak or incomplete sessions. Each session gets its own Markdown file under `sessions/`. Analytics are generated from those files into `data/analytics.json`, which powers the local dashboard.

## Modes

1. Core Interview Readiness
   - Source of truth: `context/PROFILE.md`
   - Goal: become interview-ready for roles matching the profile.

2. Broad Concept Coverage
   - Scope: full-stack development concepts that support interviews but are not the main profile-defense track.
   - Goal: build useful breadth without distracting from Core readiness.

## Session Flow

Every session should follow this shape:

1. Energy check: `low`, `medium`, or `high`
2. 5-10 minute revision of important Core topics
3. Teaching phase for the selected topic
4. Grill phase after teaching
5. Score, gaps, and next actions
6. Commit the session attempt

Energy adaptation:
- `low`: revise, teach one small concept, light grill
- `medium`: teach one normal concept, moderate grill
- `high`: teach deeply, stronger follow-ups, update answer bank

## Commands

Generate analytics:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\generate-analytics.ps1
```

Build LLM context:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\build-llm-context.ps1
```

Open dashboard:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\open-dashboard.ps1
```

Commit a session attempt:

```powershell
git add sessions data
git commit -m "Log prep session YYYY-MM-DD topic-name"
```

Create a new session file:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\new-session.ps1 -Topic "SQL indexing 30 percent claim" -Mode "Core Interview Readiness" -Energy low
```

## Metrics

The dashboard tracks:
- sessions attempted
- streak
- topics covered
- weak topics
- answer quality score
- energy trend
- Core vs Broad split
- revision frequency
- Git commit history
- interview readiness percentage

## GitHub

This repo is intended to be backed by a private GitHub repository. Session attempts should be committed and pushed even when the session is weak, incomplete, or mostly diagnostic.

## LLM Sessions

An LLM running a prep session should start by reading `LLM_HANDOFF.md`, `LLM_SESSION_PROTOCOL.md`, and `llm-context.md`. The context bundle includes repo docs, topics, session history, and repo-local prep/profile context files.

The repo is portable: another LLM should be able to continue from the GitHub link alone.

## Session Template

Source: `SESSION_TEMPLATE.md`

# Session: YYYY-MM-DD - Topic

```yaml
date: YYYY-MM-DD
mode: Core Interview Readiness
topic: Topic Name
energy: low
status: attempted
revision_done: false
quality_score: 0
readiness_delta: 0
tags:
  - tag
```

## Revision

Core topics revised for 5-10 minutes:
- 

## Teaching Notes

What was taught:
- 

## Grill

Questions asked:
1. 

Answers given:
- 

## Score

Quality score: 0/5

What worked:
- 

Weak spots:
- 

## Next Actions

- 

## Commit

Committed: no

## Topic: broad-concept-coverage

Source: `topics/broad-concept-coverage.md`

# Broad Concept Coverage

Scope: full-stack development concepts that support interviews but are not the main Core profile-defense track.

## Backend

- authentication and authorization
- caching
- pagination and filtering
- rate limiting
- background jobs
- file uploads
- logging and observability
- testing APIs
- deployment basics

## Frontend

- component design
- forms and validation
- client-side routing
- state management
- API error handling
- loading and empty states
- accessibility basics
- performance basics

## Database

- ACID
- isolation levels
- transactions
- normalization
- denormalization
- schema migrations
- query optimization basics

## Full-Stack System Skills

- Git workflows
- Docker basics
- environment variables
- CI/CD basics
- security basics
- debugging production issues
- API documentation

## AI-Adjacent Full-Stack

- LLM API integration
- RAG basics
- embeddings
- tool-calling concepts
- agent safety basics
- prompt/version tracking

## Topic: core-interview-readiness

Source: `topics/core-interview-readiness.md`

# Core Interview Readiness

Source of truth: `context/PROFILE.md`

## Resume Defense Topics

Priority 1:
- 60% support response-time reduction
- 30% PostgreSQL query performance improvement
- Digio e-sign / digital KYC integration
- CDSL depository integration
- WebSocket real-time chat
- WhatsApp Business API automation
- NSCCL settlement-file browser automation
- Pre-commit secret scanning
- Claude Code / AI-assisted tooling across 21 repos

Priority 2:
- HCP CRM AI Agent
- codebase-rag
- AI Code Reviewer
- Claude Job-Hunt Agent
- Compliance Drift Sentinel

## Core Technical Topics

- SQL indexing and query plans
- FastAPI dependency injection
- Pydantic validation
- Django ORM and migrations
- DRF serializers
- JWT auth
- Python async and event loop
- JavaScript promises and event loop
- React hooks and reconciliation
- REST API design

## Readiness Rubric

Score each Core topic from 0 to 5:

- 0: not attempted
- 1: vague recognition
- 2: can explain basics with help
- 3: can answer a normal interview question
- 4: can handle follow-ups with examples
- 5: can defend implementation, tradeoffs, and metrics clearly

## Portable Context: PROFILE.md

Source: `context/PROFILE.md`

# Master Profile â€” Vashu Singh

> Single source of truth for the job search. Resumes, cover letters, and application answers are
> generated from here. Keep it current. (All `<TODO>`s filled as of 2026-07-16 â€” MCA institute/year and
> both project links.)

## Contact
- **Name:** Vashu Singh
- **Title:** Full Stack Developer
- **Email:** rajputvashusingh@gmail.com  _(personal â€” use for all applications)_
- **Phone:** 9380892737
- **Location:** Bengaluru, India
- **LinkedIn:** https://www.linkedin.com/in/vashu-singh/
- **GitHub:** https://github.com/Vashu2003

## Target
- **Job titles:** Full Stack Developer; also Frontend (React) Developer, Backend/Python Developer (FastAPI/Django)
- **Location preference:** Bengaluru (on-site / hybrid)
- **Experience level:** ~1 year (Full Stack Developer since Aug 2025)
- **Current compensation:** 3 LPA
- **Salary expectation:** 7 LPA (negotiable band 6â€“8 LPA)
- **Notice period:** 30 days

## Summary
Full Stack Developer with ~1 year of professional experience building production web apps and AI-assisted
tooling at a fintech brokerage. Strong across the stack: React/Tailwind on the frontend; FastAPI, Django,
and Node/Express on the backend; PostgreSQL and MongoDB for data. Shipped real-time systems (WebSockets,
WhatsApp Business API), fintech integrations (Digio e-KYC, CDSL), and internal AI developer tooling across
21 repos. BCA graduate (2025), currently completing an MCA (final year).

## Skills
- **Languages:** Python, JavaScript (ES6+), HTML5, CSS3
- **Frontend:** React.js, Tailwind CSS, React Router
- **Backend:** FastAPI, Django, Node.js, Express.js, JWT / REST APIs
- **Databases:** PostgreSQL, MongoDB
- **Tools & DevOps:** Docker, Git, GitHub, Postman
- **AI:** Claude Code, OpenAI, Google Gemini AI, Antigravity

## Experience

### Full Stack Developer â€” ATS Share Brokers (Aug 2025 â€“ Present)
*Bengaluru, Karnataka, India*
- Automated customer-support operations using OpenClaw AI, cutting response time by 60% via intelligent
  query handling and automated ticket resolution.
- Developed real-time chat applications using WebSockets for live messaging and WhatsApp Business API for
  automated, instant client replies.
- Designed PostgreSQL schemas and indexing strategies that improved query performance by 30%.
- Built RESTful APIs in Django/FastAPI integrating third-party fintech services â€” Digio (e-sign/digital KYC)
  and CDSL (depository).
- Built internal AI-assisted developer tooling (Claude Code) across 21 repos â€” custom automation skills,
  git hooks, and a cross-repo change-impact and security-review workflow.
- Automated back-office operations (daily NSCCL F&O settlement-file retrieval via browser automation) and a
  pre-commit secret-scanning hook that blocks credential leaks (AWS/GitHub/API keys).

## Projects

### AI Code Reviewer â€” React, Tailwind, FastAPI, Docker, Google Gemini AI
- Full-stack code-review platform integrating Google Gemini AI for real-time Python/JavaScript analysis with
  bug detection, efficiency scoring, and auto-corrections.
- Responsive UI with Monaco Editor and Chart.js; sample-answer management and history tracking.
- Deployed with Docker (frontend on Netlify, backend on Railway).
- **Link:** https://github.com/Vashu2003/AI-Code-Reviewer

### HCP CRM â€” AI Agent for Pharma Field Sales â€” React/Redux, FastAPI, PostgreSQL, LangGraph, Groq LLM
- AI-first CRM module for pharma field reps: a split-view "Log Interaction" screen where the rep describes a
  visit in plain language ("Met Dr. Sharma, discussed Xarelto, positive, follow up next week") and a LangGraph
  agent (5 tools, Groq LLM) fills the structured form in real time â€” HCP, product, channel, sentiment, follow-up.
- Full-stack: FastAPI backend, PostgreSQL, React/Redux frontend.
- **Link:** https://github.com/Vashu2003/hcp-crm-ai-agent

### codebase-rag â€” FastAPI, Chroma, Next.js, Ollama / Gemini
- AST-aware RAG system that answers plain-English questions about any codebase with `file:line` citations
  ("Where is auth handled?", "What breaks if I change this endpoint?").
- Runs fully free and offline (local embeddings + Ollama) or against Gemini's free tier for higher-quality
  answers; includes a CI pipeline.
- **Link:** https://github.com/Vashu2003/codebase-rag

### Compliance Drift Sentinel â€” FastAPI, DataHub, AI Agents (hackathon build)
- Built for "Build with DataHub: The Agent Hackathon" (Open/Wildcard track): an AI agent that reads DataHub's
  column-level data lineage to predict which downstream report field breaks when an upstream schema changes,
  then writes a proposed data contract back to the graph.
- Fintech/compliance-adjacent data-integrity problem â€” ties directly to the brokerage domain background.
- **Link:** https://github.com/Vashu2003/compliance-drift-sentinel

### Claude Job-Hunt Agent â€” Python, Claude Code, Telegram Bot, Gmail API, Browser Automation
- An autonomous LLM-agent system (built on Claude Code) that discovers and scores job postings against a
  candidate profile, with a human-in-the-loop Telegram approval flow, safety rails (rate limits, quiet hours,
  kill switch), and Gmail reply-tracking â€” a real production agent, not a toy demo.
- Demonstrates practical agentic-AI engineering: tool orchestration, structured scoring, and safe autonomous
  operation with human oversight built in.
- **Link:** https://github.com/Vashu2003/claude-job-hunt-agent

## Education
- **Master of Computer Applications (MCA)** â€” Sikkim Skill University, (pursuing â€” final year, expected Julâ€“Sept 2027)
- **Bachelor of Computer Application (BCA)** â€” Sambhram Academy of Management Studies, Bengaluru (Sep 2022 â€“ Sep 2025)

## Achievements & Leadership
- **Rajya Puraskar Award** â€” National-level Hindustan Scouts & Guides recognition for leadership and service.
- **Athletics** â€” 1st in 100m, 2nd in Throw Ball at inter-college competition.

## Notes for tailoring
- For **frontend roles:** lead with React/Tailwind, AI Code Reviewer, Monaco/Chart.js UI work; HCP CRM's
  React/Redux frontend as a secondary example.
- For **backend/Python roles:** lead with FastAPI/Django REST APIs, PostgreSQL indexing, fintech integrations;
  codebase-rag (FastAPI + Chroma) as a backend-heavy AI project.
- For **full-stack roles:** lead with the ATS Share Brokers experience end-to-end + HCP CRM AI Agent
  (FastAPI + React/Redux + LangGraph).
- For **AI/agentic roles** (increasingly common in the pipeline): lead with claude-job-hunt-agent (production
  autonomous LLM agent, human-in-the-loop, safety rails) + codebase-rag (AST-aware RAG) + HCP CRM (LangGraph
  tool-use agent) â€” this is now the strongest differentiator, not an afterthought.
- Fintech/brokerage domain (Digio, CDSL, NSCCL) is a differentiator for fintech employers; compliance-drift-
  sentinel adds a second fintech/data-integrity angle.
- AI tooling experience (Claude Code, Gemini, OpenAI, LangGraph) is a strong angle for AI-forward startups â€”
  now backed by real shipped agent projects, not just tool familiarity.
- Note: AI Code Reviewer (kept above) is also ~1yr old (pushed 2025-07-05) â€” still solid and already properly
  linked, but if a 5th project slot opens up, codebase-rag or HCP CRM are more current alternatives.

## Portable Context: recovered-interview-prep-tracker.md

Source: `context/recovered-interview-prep-tracker.md`

# Interview Prep Tracker - Vashu Singh

Resumed: 2026-07-27

This is the rebuilt tracking file for interview preparation. It is based on:
- `Desktop/laptop-migration/Desktop/LEAN_TRACK.md`
- `JobSearch/interview-prep-nextalphaai-bairesdev.md`
- `JobSearch/PROFILE.md`
- `JobSearch/resume/master-resume.md`

## Current Goal

Prepare for junior/early-career full-stack, frontend React, and backend Python interviews, with the strongest emphasis on fintech full-stack roles.

Success criteria:
- Defend every major resume claim with a concrete technical story.
- Be interview-ready on SQL/indexing, FastAPI/Django, Python async, JS/React, REST APIs, and DSA basics.
- Keep one active prep session at a time, with clear next action after each session.

## Recovered Status

Already covered enough to refresh, not restart:
- Python M1: CPython / bytecode - L2
- Python M2: GIL - L2, needs a short refresh
- Python M3: data model / dunders - L2
- DSA hashing: Two Sum, Contains Duplicate, Valid Anagram, Group Anagrams - L2/L3

Needs stricter practice:
- Read-back after learning: explain the topic from memory after every session.
- Resume-claim defense: answers must include exact implementation, tradeoffs, and measurement.

## Priority Order

### Tier 1 - Do First

1. Resume defense track
   - 60% support response-time reduction
   - 30% PostgreSQL query performance improvement
   - Digio e-sign / digital KYC integration
   - CDSL depository integration
   - WebSocket real-time chat
   - WhatsApp Business API automation
   - NSCCL settlement-file browser automation
   - Pre-commit secret scanning across repos
   - Claude Code / AI-assisted developer tooling across 21 repos

2. SQL and indexing
   - joins
   - B-tree indexes
   - composite indexes
   - covering indexes
   - `EXPLAIN` / `EXPLAIN ANALYZE`
   - N+1 query problems
   - before/after measurement for the 30% claim

3. FastAPI and Django
   - FastAPI dependency injection
   - Pydantic models and validation
   - async endpoints
   - Django ORM
   - DRF serializers
   - migrations
   - auth/JWT

4. Python async
   - generators and decorators as prerequisite refresh
   - event loop
   - coroutines
   - `async` / `await`
   - async I/O vs threading
   - WebSocket relevance

5. JavaScript and React
   - closures
   - `this`
   - promises
   - event loop
   - hooks
   - state management
   - reconciliation and keys

6. DSA
   - 1 problem/day, 4-5 days/week
   - two pointers
   - sliding window
   - linked list
   - stack/queue
   - trees
   - recursion and DP basics

7. REST API design
   - methods
   - status codes
   - idempotency
   - pagination
   - filtering
   - versioning
   - error handling

### Tier 2 - Headline Answers Only

- DBMS: ACID, isolation levels, transactions
- OS: process vs thread, deadlock, mutex vs semaphore
- Networks: TCP vs UDP, HTTP/HTTPS, TLS, WebSockets
- Node/Express and MongoDB basics

### Tier 3 - Defer

- TypeScript
- Next.js
- Deep LLD / system design

Keep LLD light: SOLID, basic patterns, and simple API/service design.

## Active Session Queue

### Session 1 - SQL/indexing: defend the 30% claim

Goal:
Create a concrete answer for: "You said you improved query performance by 30%. What exactly did you do?"

Checklist:
- [ ] Identify the slow query type from ATS work.
- [ ] Explain the old schema/query shape.
- [ ] Explain the index added: single-column, composite, or covering.
- [ ] Explain how `EXPLAIN ANALYZE` would show improvement.
- [ ] Explain the before/after metric.
- [ ] Prepare a 60-second answer.
- [ ] Prepare a deeper 2-minute answer.
- [ ] Do one SQL/indexing quiz.

Output:
- [ ] Final answer saved under "Answer Bank".

### Session 2 - WebSockets and real-time chat

Goal:
Defend real-time chat work clearly.

Checklist:
- [ ] Explain connection lifecycle.
- [ ] Explain message flow from client to backend to recipient.
- [ ] Explain reconnect behavior.
- [ ] Explain auth for WebSocket connections.
- [ ] Explain scaling concern: multiple workers/instances and pub-sub.
- [ ] Prepare a 60-second answer.

### Session 3 - Digio/CDSL fintech integrations

Goal:
Show fintech domain credibility.

Checklist:
- [ ] Explain Digio e-sign/KYC flow.
- [ ] Explain CDSL integration purpose.
- [ ] Explain API auth and request/response handling.
- [ ] Explain retries, failures, and logging.
- [ ] Explain compliance-sensitive handling.

### Session 4 - FastAPI/Django backend depth

Goal:
Prepare for backend framework questions.

Checklist:
- [ ] FastAPI dependency injection.
- [ ] Pydantic validation.
- [ ] Django ORM and migrations.
- [ ] DRF serializers.
- [ ] JWT auth.
- [ ] N+1 query example.

### Session 5 - JS/React fundamentals

Goal:
Refresh frontend interview basics.

Checklist:
- [ ] `var` / `let` / `const`
- [ ] closures
- [ ] `this`
- [ ] promises and event loop
- [ ] `useState`
- [ ] `useEffect`
- [ ] list keys and reconciliation
- [ ] controlled inputs

## Daily Prep Loop

Use this loop for each prep day:

1. Pick one active session.
2. Study only the minimum needed for that session.
3. Answer interview-style questions out loud.
4. Write the final answer in the Answer Bank.
5. Do one DSA problem if energy allows.
6. Mark the next action before stopping.

Time boxes:
- Light day: 45 minutes
- Normal day: 90 minutes
- Strong day: 2.5 hours

## DSA Tracker

Hashing:
- [x] Two Sum
- [x] Contains Duplicate
- [x] Valid Anagram
- [x] Group Anagrams

Next patterns:
- [ ] Two Pointers
- [ ] Sliding Window
- [ ] Stack / Queue
- [ ] Linked List
- [ ] Trees
- [ ] Recursion basics
- [ ] DP basics

## Answer Bank

### Tell me about yourself

Draft:
I am Vashu, a full-stack developer with about one year of experience at a fintech brokerage in Bengaluru. I work across React and Tailwind on the frontend, and FastAPI, Django, Node, PostgreSQL, and MongoDB on the backend. My strongest experience is in production fintech systems: real-time chat with WebSockets, WhatsApp Business API automation, Digio e-KYC, CDSL integrations, and PostgreSQL query optimization. I also build AI-assisted developer tools and side projects, including an AI code reviewer, an AI-agent CRM, and a codebase RAG system.

### 30% query performance improvement

Status: TODO - make this concrete in Session 1.

Required shape:
- Situation: what query was slow
- Task: what performance target or pain existed
- Action: schema/index/query change
- Result: before/after measurement
- Follow-up depth: why that index worked

### 60% support response-time reduction

Status: TODO

Required shape:
- Situation: manual repetitive support queries
- Task: reduce response time without increasing headcount
- Action: AI query handling, automated ticket resolution, WebSocket chat, WhatsApp Business API
- Result: 60% faster response time

### Digio/CDSL integration

Status: TODO

Required shape:
- Situation: digital onboarding / brokerage operations
- Task: integrate compliant third-party fintech services
- Action: REST APIs, auth, request validation, error handling, logging
- Result: reliable onboarding and depository workflow

### WebSocket real-time chat

Status: TODO

Required shape:
- connection lifecycle
- auth
- message routing
- reconnect handling
- scaling concerns

## Next Action

Start with Session 1: SQL/indexing and the 30% query performance claim.

First question to answer:
"What was the slow query, what index did you add, and how did you verify the 30% improvement?"

## Portable Context: interview-prep-nextalphaai-bairesdev.md

Source: `context/interview-prep-nextalphaai-bairesdev.md`

# Interview Prep â€” Vashu Singh

For: **NextAlphaAI** (AI interview, ~24h window) + **BairesDev** (MCQ test battery)
Built from your Master Profile Â· Date: 13 Jul 2026

---

## PART 1 â€” JavaScript Fundamentals Cheat-Sheet
> These are the exact MCQ/quick-answer topics BairesDev's JS + Algorithms sections and NextAlphaAI's technical questions pull from. Skim until each one feels obvious.

### Core language
- **`var` vs `let` vs `const`** â€” `var` is function-scoped + hoisted (init `undefined`); `let`/`const` are block-scoped + in the "temporal dead zone" until declared. `const` = can't reassign the binding (object contents can still change).
- **`==` vs `===`** â€” `==` coerces types (`0 == "0"` â†’ true, `null == undefined` â†’ true). `===` no coercion. **Always use `===`.**
- **Hoisting** â€” declarations move to top of scope. Function *declarations* fully hoisted; function *expressions*/arrow fns are not.
- **`this`** â€” depends on *how a function is called*: method â†’ the object; plain call â†’ `undefined`/global; arrow fn â†’ inherits `this` from enclosing scope (no own `this`); `.bind/.call/.apply` set it explicitly.
- **Closures** â€” an inner function "remembers" variables from its outer scope even after the outer function returns. Classic use: private state, counters, callbacks.
- **Truthy/falsy** â€” falsy: `false, 0, "", null, undefined, NaN`. Everything else truthy (incl. `[]` and `{}`).

### Arrays & objects (high-frequency MCQs)
- `map` â†’ new array, transform each. `filter` â†’ new array, keep matches. `reduce` â†’ fold to one value.
- `forEach` returns `undefined` (side-effects only). `find` â†’ first match. `some`/`every` â†’ boolean.
- Spread `...` to copy/merge: `[...a, ...b]`, `{...obj, key: val}`. Copies are **shallow**.
- `slice` (non-mutating) vs `splice` (mutates). Know the difference â€” common trick question.

### Async
- **Event loop** â€” JS is single-threaded; async callbacks wait in a queue and run after the current stack clears. Microtasks (promises) run before macrotasks (setTimeout).
- **Promise** â€” `.then/.catch/.finally`, or `async/await` with `try/catch`. `await` pauses until the promise settles.
- `Promise.all` (all succeed or reject fast) vs `Promise.allSettled` (waits for all, never rejects).

### React (for NextAlphaAI + BairesDev JS)
- **Components** = functions returning JSX. Props flow **down**, immutable.
- **`useState`** â€” returns `[value, setter]`; setting triggers re-render. Never mutate state directly â€” always set a new value/object.
- **`useEffect`** â€” side-effects (fetch, subscriptions); dependency array controls when it runs; return a cleanup fn.
- **Keys** â€” stable unique `key` on list items so React reconciles correctly.
- **Controlled inputs** â€” value driven by state + `onChange`.
- **Lifting state up** â€” shared state lives in the closest common parent.

### Algorithms (BairesDev has a short 10Q/10min section)
- Big-O basics: loop = O(n), nested loop = O(nÂ²), binary search = O(log n).
- Know: reverse a string/array, find max/min, check palindrome, dedupe an array (`new Set()`), FizzBuzz, sum/average of array.

### Numerical reasoning (BairesDev Logic sections â€” biggest time pressure)
- Number series: find the rule (add, multiply, alternating, differences of differences).
- Basic arithmetic, ratios, percentages, speed = distance/time.
- **Strategy:** move fast, flag hard ones, come back. Don't burn 3 min on one question.

---

## PART 2 â€” Your STAR Stories (from real experience)
> STAR = Situation, Task, Action, Result. Say them out loud until they're natural â€” don't memorize word-for-word. Each is ~45â€“60 sec.

### Story A â€” "Tell me about something impactful you built" (AI + automation)
- **S:** At ATS Share Brokers, customer support was slow â€” agents manually handled repetitive client queries.
- **T:** I was asked to reduce support response time without adding headcount.
- **A:** I built an AI-assisted support automation using OpenClaw AI for intelligent query handling and automated ticket resolution, plus a real-time chat layer over WebSockets and the WhatsApp Business API for instant client replies.
- **R:** Cut response time by ~60% and freed the team to focus on complex cases. **(Metric + ownership.)**

### Story B â€” "A technical challenge you solved" (performance)
- **S:** Some PostgreSQL-backed queries in our fintech app were getting slow as data grew.
- **T:** Improve query performance without a schema rewrite.
- **A:** I redesigned the schema and added targeted indexing strategies based on the actual query patterns, and measured before/after.
- **R:** Query performance improved ~30%. Taught me to profile first, then optimize the real bottleneck.

### Story C â€” "Working with complex/external systems" (fintech domain â€” USE THIS for NextAlphaAI)
- **S:** We needed compliant digital onboarding for a stock brokerage.
- **T:** Integrate third-party fintech services for e-KYC and depository operations.
- **A:** I built RESTful APIs in Django/FastAPI integrating **Digio** (e-sign / digital KYC) and **CDSL** (depository), and automated daily **NSCCL** F&O settlement-file retrieval via browser automation.
- **R:** Reliable, compliant onboarding + back-office automation. **This is your fintech credibility â€” lean on it hard for NextAlphaAI (Mobile Fintech).**

### Story D â€” "Initiative / going beyond the task" (security + AI tooling)
- **S:** Across 21 repos there was risk of credentials leaking into commits.
- **T:** No one asked me to, but I saw the exposure.
- **A:** I built internal AI-assisted developer tooling (Claude Code) â€” a pre-commit secret-scanning hook that blocks AWS/GitHub/API-key leaks, plus a cross-repo change-impact and security-review workflow.
- **R:** Prevented credential leaks proactively; showed ownership beyond my assigned work.

### "Why this role?" (NextAlphaAI)
> "I've spent the past year building full-stack, real-time systems specifically in the fintech/brokerage domain â€” e-KYC, depository integrations, WebSocket messaging. NextAlphaAI's mobile-fintech focus lines up almost exactly with what I've shipped, and I'm excited to bring that domain knowledge to a product being built AI-first, which is how I already work day to day."

---

## PART 3 â€” NextAlphaAI AI interview â€” keyword & delivery kit
Role: **Full Stack / Front End Engineer (Mobile Fintech)**. The AI transcribes you and keyword-matches. Weave these in *naturally* (don't list them):
`React` Â· `full-stack` Â· `REST APIs` Â· `FastAPI / Django` Â· `responsive UI` Â· `WebSockets / real-time` Â· `fintech` Â· `e-KYC` Â· `authentication (JWT)` Â· `PostgreSQL` Â· `AI-first`

### Your 60â€“90 sec intro (rehearse out loud x2)
> "I'm Vashu, a full-stack developer with about a year of professional experience at a fintech stock brokerage in Bengaluru. On the frontend I work in React and Tailwind; on the backend, FastAPI, Django, and Node with PostgreSQL and MongoDB. What's most relevant here is that I've built production fintech systems â€” real-time chat over WebSockets, WhatsApp Business API integration, and compliant onboarding through Digio e-KYC and CDSL depository APIs. I also build AI-assisted developer tooling as part of my daily workflow, so an AI-first product feels natural to me. Outside work I'm finishing my MCA and keep building side projects like an AI code reviewer using Gemini."

### Delivery checklist
- [ ] Quiet room, door shut, phone silent
- [ ] Light **facing you** (window/lamp behind webcam), not behind you
- [ ] Headphones or a decent mic; test audio first
- [ ] **Look at the camera lens**, not your own video
- [ ] Energy ~110% â€” video flattens you; smile at the start
- [ ] Speak in full sentences; pause to think instead of "um/uh/like"
- [ ] Have water nearby; keep answers ~60â€“90 sec, then stop

---

## Suggested order
1. **NextAlphaAI first** â€” 24h clock. Do the delivery checklist + rehearse intro, then take it.
2. **BairesDev** â€” block a quiet 2h slot when fresh. Warm up: 20 min JS review + 20 numerical-series practice questions under a timer, then start.

You've shipped real production fintech software in a year. These are checking for exactly what you already do. Go in calm.

## Portable Context: LEAN_TRACK.md

Source: `context/LEAN_TRACK.md`

# LEAN TRACK v1 â€” High-Yield Reprioritization (2026-06-22)

Built from Vashu's actual resume. Replaces the "cover everything" order of SYLLABUS.md.
Principle: prep what interviewers ASK a junior fintech full-stack dev, weighted to HIS stack + projects.

## Status carried from diagnostic (don't re-grind)
- Python M1 (CPython/bytecode) âœ… L2
- Python M2 (GIL) âœ… L2  (refresh: faded over the 4-day gap â€” 2-min re-read, not a re-teach)
- Python M3 (data model/dunders) âœ… L2
- DSA Hashing pattern âœ… â€” Two Sum, Contains Duplicate, Valid Anagram, Group Anagrams (L2â€“L3)
- Read-back gate: self-initiates (Session 11), needs to go deep + every-paste

## TIER 1 â€” where the offer is won (do these first)
1. **"Defend your resume" track** â€” HIGHEST yield, unique to you. Every number you wrote, you must defend cold:
   - "Cut response time 60%" â€” exact flow, what the automation did, how you measured it
   - "Improved query performance 30%" â€” WHICH indexes, EXPLAIN ANALYZE, before/after, why it worked
   - Digio (e-sign/KYC) + CDSL (depository) integration â€” what the API contracts looked like, auth, error handling
   - WebSockets real-time chat â€” connection lifecycle, scaling, reconnection
   - Pre-commit secret-scanning hook + 21-repo Claude Code tooling â€” architecture, what it caught
2. **SQL + indexing** â€” you literally claim a 30% gain. Joins, indexes (B-tree/composite/covering), EXPLAIN, N+1. Non-negotiable.
3. **FastAPI + Django depth** â€” your backend. DI, Pydantic, async, DRF serializers, ORM N+1, migrations.
4. **Python M5 (asyncio)** â€” directly powers your FastAPI/WebSockets work. High-yield. (M4 generators/decorators first, it's a prereq.)
5. **JS core + React** â€” closures/this/promises, hooks, reconciliation, state mgmt. Your frontend half.
6. **DSA patterns** â€” continue 1/day, 4â€“5x/week: Two Pointers â†’ Sliding Window â†’ Linked List â†’ Stack/Queue â†’ Trees â†’ recursion/DP basics.
7. **REST API design** â€” methods, status codes, idempotency, versioning. Quick, high-yield.

## TIER 2 â€” headline answers only (know the 5, don't grind)
- DBMS: ACID, isolation levels (matters in trading) â€” moderate
- Node/Express, MongoDB (HyperHive) â€” you list them; know the basics
- OS: process vs thread, deadlock, mutex vs semaphore
- Networks: TCP vs UDP, 3-way handshake, HTTP/HTTPS, TLS, WebSockets (ties to your real-time work)

## TIER 3 â€” CUT or defer (not interview gates at your level)
- TypeScript, Next.js â€” not even on your resume. Cut for now; add post-offer.
- LLD / System Design â€” light touch only (SOLID + a couple patterns). Junior roles rarely go deep.

## Project deep-dive corrections (resume vs old syllabus notes)
- "CodeCheck AI" = **AI Code Reviewer** (Gemini, Monaco, Chart.js, Docker, Netlify+Railway)
- HyperHive uses **Jitsi** for video/screen-share + **JWT/RBAC** â€” NOT Socket.io/WebRTC as old notes assumed. Fix the prep.
- Movie DB (TMDB, localStorage) â€” minor, unlikely to be grilled

## Faster method (per module)
watch/read the critical 20% â†’ I quiz interview-style â†’ gap-fill ONLY what's weak â†’ DSA â†’ done.
No slow build-up on things already half-known.

## Parallel accelerator
Start applying in ~2 weeks even at ~75%. Early interviews are free practice + job-search momentum.

## Suggested Session 13 (fresh start)
Lead with TIER 1 #1 â€” the SQL/indexing "defend your 30%" prep, since it's a guaranteed question AND backs a resume claim. Fresh energy, not tired-at-night.

## Session: 2026-07-27-system-scope-rebuild

Source: `sessions/2026-07-27-system-scope-rebuild.md`

# Session: 2026-07-27 - System Scope Rebuild

```yaml
date: 2026-07-27
mode: Core Interview Readiness
topic: Interview prep system scope
energy: medium
status: attempted
revision_done: false
quality_score: 4
readiness_delta: 1
tags:
  - system-design
  - scope
  - tracker
```

## Revision

Core topics revised for 5-10 minutes:
- No technical revision. This was a scoping and rebuild session.

## Teaching Notes

What was established:
- The prep system needs two modes: Core Interview Readiness and Broad Concept Coverage.
- Core Interview Readiness uses `JobSearch/PROFILE.md` as the latest resume/profile source.
- Broad Concept Coverage stays tied to full-stack development concepts.
- Every attempted session counts and should be logged.
- Each session gets its own Markdown file.
- The system should use Markdown plus a dashboard.
- Speed and reliability matter more than a complex app.
- Energy levels are `low`, `medium`, and `high`.
- Sessions should adapt to energy and answer quality.
- Teaching happens before grilling.
- Grilling level starts moderate because preparation is restarting.

## Grill

Questions asked:
1. What are we rebuilding?
2. What counts as a successful session?
3. Should every attempt be committed?
4. What format should the system use?
5. Where should the repo live?
6. Static dashboard or app?
7. Speed/reliability or rich analytics first?
8. What are the two mode names?
9. What source powers Core readiness?
10. What scope powers Broad coverage?
11. How aggressive should grilling be?
12. What is the session structure?
13. Should sessions adapt to energy?
14. Which metrics should the dashboard include?

Answers given:
- Build a full prep system.
- Every attempt counts as a session.
- Every attempt should be committed.
- Use Markdown and a dashboard.
- Each session gets its own Markdown file.
- Create a separate repo.
- Optimize for speed and reliability.
- Use the proposed mode names.
- Use `PROFILE.md` as the latest resume/profile.
- Keep Broad coverage tied to full-stack development.
- Use moderate grilling.
- Teach first, then grill.
- Adapt to low/medium/high energy.
- Include all proposed metrics.

## Score

Quality score: 4/5

What worked:
- Scope became concrete enough to build.
- The system now has clear operating rules.
- The source of truth for Core readiness is explicit.

Weak spots:
- GitHub remote target is not decided yet.
- Exact readiness scoring may need calibration after several sessions.
- No real concept learning happened in this session.

## Next Actions

- Generate analytics.
- Initialize git.
- Commit the baseline system and this attempt.
- Next prep session should start with Core: SQL/indexing and the 30% query performance claim.

## Commit

Committed: pending


