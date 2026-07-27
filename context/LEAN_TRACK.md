# LEAN TRACK v1 — High-Yield Reprioritization (2026-06-22)

Built from Vashu's actual resume. Replaces the "cover everything" order of SYLLABUS.md.
Principle: prep what interviewers ASK a junior fintech full-stack dev, weighted to HIS stack + projects.

## Status carried from diagnostic (don't re-grind)
- Python M1 (CPython/bytecode) ✅ L2
- Python M2 (GIL) ✅ L2  (refresh: faded over the 4-day gap — 2-min re-read, not a re-teach)
- Python M3 (data model/dunders) ✅ L2
- DSA Hashing pattern ✅ — Two Sum, Contains Duplicate, Valid Anagram, Group Anagrams (L2–L3)
- Read-back gate: self-initiates (Session 11), needs to go deep + every-paste

## TIER 1 — where the offer is won (do these first)
1. **"Defend your resume" track** — HIGHEST yield, unique to you. Every number you wrote, you must defend cold:
   - "Cut response time 60%" — exact flow, what the automation did, how you measured it
   - "Improved query performance 30%" — WHICH indexes, EXPLAIN ANALYZE, before/after, why it worked
   - Digio (e-sign/KYC) + CDSL (depository) integration — what the API contracts looked like, auth, error handling
   - WebSockets real-time chat — connection lifecycle, scaling, reconnection
   - Pre-commit secret-scanning hook + 21-repo Claude Code tooling — architecture, what it caught
2. **SQL + indexing** — you literally claim a 30% gain. Joins, indexes (B-tree/composite/covering), EXPLAIN, N+1. Non-negotiable.
3. **FastAPI + Django depth** — your backend. DI, Pydantic, async, DRF serializers, ORM N+1, migrations.
4. **Python M5 (asyncio)** — directly powers your FastAPI/WebSockets work. High-yield. (M4 generators/decorators first, it's a prereq.)
5. **JS core + React** — closures/this/promises, hooks, reconciliation, state mgmt. Your frontend half.
6. **DSA patterns** — continue 1/day, 4–5x/week: Two Pointers → Sliding Window → Linked List → Stack/Queue → Trees → recursion/DP basics.
7. **REST API design** — methods, status codes, idempotency, versioning. Quick, high-yield.

## TIER 2 — headline answers only (know the 5, don't grind)
- DBMS: ACID, isolation levels (matters in trading) — moderate
- Node/Express, MongoDB (HyperHive) — you list them; know the basics
- OS: process vs thread, deadlock, mutex vs semaphore
- Networks: TCP vs UDP, 3-way handshake, HTTP/HTTPS, TLS, WebSockets (ties to your real-time work)

## TIER 3 — CUT or defer (not interview gates at your level)
- TypeScript, Next.js — not even on your resume. Cut for now; add post-offer.
- LLD / System Design — light touch only (SOLID + a couple patterns). Junior roles rarely go deep.

## Project deep-dive corrections (resume vs old syllabus notes)
- "CodeCheck AI" = **AI Code Reviewer** (Gemini, Monaco, Chart.js, Docker, Netlify+Railway)
- HyperHive uses **Jitsi** for video/screen-share + **JWT/RBAC** — NOT Socket.io/WebRTC as old notes assumed. Fix the prep.
- Movie DB (TMDB, localStorage) — minor, unlikely to be grilled

## Faster method (per module)
watch/read the critical 20% → I quiz interview-style → gap-fill ONLY what's weak → DSA → done.
No slow build-up on things already half-known.

## Parallel accelerator
Start applying in ~2 weeks even at ~75%. Early interviews are free practice + job-search momentum.

## Suggested Session 13 (fresh start)
Lead with TIER 1 #1 — the SQL/indexing "defend your 30%" prep, since it's a guaranteed question AND backs a resume claim. Fresh energy, not tired-at-night.