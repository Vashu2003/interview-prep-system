# LLM Session Protocol

This repo is used by an LLM to run interview-prep sessions.

## Required Startup Context

Before starting a session, the LLM must read:

1. `llm-context.md`
2. `README.md`
3. The latest session file in `sessions/`
4. `C:/Users/Vashu singh/JobSearch/PROFILE.md`

`llm-context.md` is generated from the repo Markdown files and selected external profile files. Regenerate it after important edits.

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

Use this when the session is about being interview-ready from `PROFILE.md`.

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

