# Session: 2026-07-29 - SQL indexing 30 percent claim

```yaml
date: 2026-07-29
mode: Core Interview Readiness
topic: SQL indexing 30 percent claim
energy: medium
status: attempted
revision_done: true
quality_score: 4
readiness_delta: 1
tags:
  - sql
  - postgresql
  - indexing
  - resume-defense
```

## Revision

Core topics revised for 5-10 minutes:
- GIL refresh: only one thread executes Python bytecode at a time in CPython; I/O-bound threads still benefit since GIL releases during I/O waits.
- DSA hashing patterns confirmed still warm (Two Sum, Contains Duplicate, Valid Anagram, Group Anagrams).

## Teaching Notes

What was taught:
- Sequential scan vs index scan, why unindexed queries are slow at scale.
- B-tree indexes: sorted structure, good for `=`, `<`, `>`, `BETWEEN`; write-cost tradeoff.
- Composite indexes: column order = search order; equality columns before range columns; among equality columns, "always-filtered" column leads even over a more selective sometimes-filtered column.
- Covering indexes: index-only scans when all needed columns are in the index.
- `EXPLAIN` (planned cost) vs `EXPLAIN ANALYZE` (actual run, real timings).
- N+1 query problem and ORM eager-loading fixes.
- How to honestly frame a measurement taken via Postman response time rather than `EXPLAIN ANALYZE`.

## Grill

Questions asked:
1. What table/query in the ATS system was likely slow, and what index would fix it?
2. Given state (always filtered), city (60%), income_range (20%) - which column leads the composite index, "always-filtered" vs "most selective"?
3. Walk through exactly what you'd check in `EXPLAIN ANALYZE` before/after to prove the 30% claim.
4. If challenged that Postman timing could be noise (caching/network/load), how do you defend the measurement?
5. What's the tradeoff of adding this composite index?

Answers given:
- Identified leads table, filters on state/city/income_range, correctly chose a composite index.
- Correctly chose `state` first (always-filtered column) over leading with the most selective column, once the tradeoff was explained.
- Admitted honestly: measurement was Postman response time, not `EXPLAIN ANALYZE` - did not overclaim.
- Defended the measurement via same test/dev DB, no other code changes, and knowledge of the endpoint logic ruling out caching/external calls as confounders.
- Correctly identified write overhead (and implicitly storage cost) as the tradeoff of indexing.

## Score

Quality score: 4/5

What worked:
- Correct structural choice (composite index) from the start.
- Reasoned through column-order logic correctly once prompted (usage frequency over raw selectivity for leading column).
- Honest, defensible answer about using Postman timing instead of claiming `EXPLAIN ANALYZE` - reframed as a strength.
- Correctly named the write-cost tradeoff of indexing.

Weak spots:
- No concrete before/after numbers yet (e.g. actual ms values) for the 30% claim - needs to be dug up or estimated for the Answer Bank.
- Has not actually run `EXPLAIN ANALYZE` in practice - should try it once for real to speak from direct experience, not just theory.
- Column-order reasoning ("always-filtered" vs "most selective") needed prompting rather than being automatic - worth a quick re-drill next SQL session.

## Next Actions

- Find or estimate real before/after response-time numbers for the leads endpoint to anchor the 30% claim concretely.
- Actually run `EXPLAIN ANALYZE` once on a similar query locally to be able to speak from real experience, not just theory.
- Write the final 60-second and 2-minute answers for "30% query performance improvement" into the Answer Bank in `context/recovered-interview-prep-tracker.md` (currently marked TODO there).
- Next Core session: Core 1 - defend the 60% support response-time claim (per SYLLABUS.md Recommended First 10 Sessions).

## Commit

Committed: yes
