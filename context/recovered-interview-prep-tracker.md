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
