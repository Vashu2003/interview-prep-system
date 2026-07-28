# Session: 2026-07-28 - SQL Indexing and the 30% Query Claim

```yaml
date: 2026-07-28
mode: Core Interview Readiness
topic: SQL indexing 30 percent claim
energy: medium
status: attempted
revision_done: true
quality_score: 4
readiness_delta: 2
tags:
  - sql
  - postgresql
  - indexing
  - resume-defense
```

## Revision

Core topics revised for 5-10 minutes:
- GIL refresh: mutex allowing one thread to run Python bytecode at a time in CPython; released during I/O waits, so I/O-bound work (DB calls) benefits from threading despite the GIL; multiple workers = multiple processes, each with its own GIL.

## Teaching Notes

What was taught:
- Index basics (book-index analogy): shortcut to avoid full table scans (sequential scans).
- Composite index / leftmost-prefix rule: index on (A, B) helps queries on A alone or A+B, not B alone.
- Covering index concept: index-only scans.
- N+1 query problem.
- EXPLAIN ANALYZE as the standard way to verify index impact (though not what was actually used here).
- Index tradeoff: faster reads vs slower writes + more disk space, why you don't index everything.

## Grill

Questions asked:
1. Why does the GIL matter less for I/O-bound FastAPI request handling than CPU-bound work?
2. Composite index (status, email): why doesn't a single-column index approach map cleanly onto this?
3. Index on (user_id, created_at): which query benefits more, filter on user_id or created_at?
4. Without an index, what does Postgres do to find matching rows?
5. What's the tradeoff of adding an index (why not index everything)?
6. Walk me through the 30% PostgreSQL improvement claim in your own words.
7. How did you measure the 30% improvement?
8. Was it one composite index or separate single-column indexes, and why?

Answers given:
- GIL: initially conflated GIL (threads) with worker processes; corrected to threads vs process-level workers.
- Composite index (status, email) query: initially unsure, corrected using phone-book analogy (sorted by city then name).
- user_id/created_at: correctly identified user_id as the one the index helps (leftmost column).
- Full table scan: correctly identified, minor correction that it scans all rows, not just until first match.
- Index tradeoff: did not know initially; learned write/update cost and disk space tradeoff.
- 30% claim: leads table, millions of rows, filtered by city/state/income with pagination (15/page); added indexes on filter columns; verified via Postman response time before/after.
- Index composition: composite index, reasoned correctly that sales execs use multiple filters together (city/state/income, possibly status); unsure if status was included in the same index.

## Score

Quality score: 4/5

What worked:
- Correctly self-corrected on leftmost-prefix reasoning after one example.
- Gave a real, honest measurement method (Postman response time) rather than inventing EXPLAIN ANALYZE usage.
- Applied the leftmost-prefix concept unprompted to justify the composite index design choice for the 30% claim.

Weak spots:
- Initial GIL answer conflated threading with multi-process workers.
- Exact index composition (was `status` included?) is not remembered - flagged as needing confirmation, not guessed.
- Has not yet been drilled on `EXPLAIN`/`EXPLAIN ANALYZE` syntax itself, only the concept.

## Next Actions

- Confirm exact index columns used for the leads table if old code/PRs are accessible.
- Next Core session: 60% support response-time reduction claim (Core 1), per SYLLABUS.md recommended order.
- Optional light follow-up later: basic `EXPLAIN ANALYZE` output reading, since concept is known but not drilled hands-on.

## Commit

Committed: no
