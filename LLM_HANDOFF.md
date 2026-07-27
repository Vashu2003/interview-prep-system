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

