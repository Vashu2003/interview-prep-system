# Interview Prep System

Markdown-first interview preparation system for Vashu Singh.

## Purpose

This repo tracks every interview-prep attempt, even weak or incomplete sessions. Each session gets its own Markdown file under `sessions/`. Analytics are generated from those files into `data/analytics.json`, which powers the local dashboard.

## Modes

1. Core Interview Readiness
   - Source of truth: `C:/Users/Vashu singh/JobSearch/PROFILE.md`
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

Open dashboard:

```powershell
Start-Process .\dashboard\index.html
```

Commit a session attempt:

```powershell
git add sessions data
git commit -m "Log prep session YYYY-MM-DD topic-name"
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

