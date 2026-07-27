# Interview Prep — Vashu Singh

For: **NextAlphaAI** (AI interview, ~24h window) + **BairesDev** (MCQ test battery)
Built from your Master Profile · Date: 13 Jul 2026

---

## PART 1 — JavaScript Fundamentals Cheat-Sheet
> These are the exact MCQ/quick-answer topics BairesDev's JS + Algorithms sections and NextAlphaAI's technical questions pull from. Skim until each one feels obvious.

### Core language
- **`var` vs `let` vs `const`** — `var` is function-scoped + hoisted (init `undefined`); `let`/`const` are block-scoped + in the "temporal dead zone" until declared. `const` = can't reassign the binding (object contents can still change).
- **`==` vs `===`** — `==` coerces types (`0 == "0"` → true, `null == undefined` → true). `===` no coercion. **Always use `===`.**
- **Hoisting** — declarations move to top of scope. Function *declarations* fully hoisted; function *expressions*/arrow fns are not.
- **`this`** — depends on *how a function is called*: method → the object; plain call → `undefined`/global; arrow fn → inherits `this` from enclosing scope (no own `this`); `.bind/.call/.apply` set it explicitly.
- **Closures** — an inner function "remembers" variables from its outer scope even after the outer function returns. Classic use: private state, counters, callbacks.
- **Truthy/falsy** — falsy: `false, 0, "", null, undefined, NaN`. Everything else truthy (incl. `[]` and `{}`).

### Arrays & objects (high-frequency MCQs)
- `map` → new array, transform each. `filter` → new array, keep matches. `reduce` → fold to one value.
- `forEach` returns `undefined` (side-effects only). `find` → first match. `some`/`every` → boolean.
- Spread `...` to copy/merge: `[...a, ...b]`, `{...obj, key: val}`. Copies are **shallow**.
- `slice` (non-mutating) vs `splice` (mutates). Know the difference — common trick question.

### Async
- **Event loop** — JS is single-threaded; async callbacks wait in a queue and run after the current stack clears. Microtasks (promises) run before macrotasks (setTimeout).
- **Promise** — `.then/.catch/.finally`, or `async/await` with `try/catch`. `await` pauses until the promise settles.
- `Promise.all` (all succeed or reject fast) vs `Promise.allSettled` (waits for all, never rejects).

### React (for NextAlphaAI + BairesDev JS)
- **Components** = functions returning JSX. Props flow **down**, immutable.
- **`useState`** — returns `[value, setter]`; setting triggers re-render. Never mutate state directly — always set a new value/object.
- **`useEffect`** — side-effects (fetch, subscriptions); dependency array controls when it runs; return a cleanup fn.
- **Keys** — stable unique `key` on list items so React reconciles correctly.
- **Controlled inputs** — value driven by state + `onChange`.
- **Lifting state up** — shared state lives in the closest common parent.

### Algorithms (BairesDev has a short 10Q/10min section)
- Big-O basics: loop = O(n), nested loop = O(n²), binary search = O(log n).
- Know: reverse a string/array, find max/min, check palindrome, dedupe an array (`new Set()`), FizzBuzz, sum/average of array.

### Numerical reasoning (BairesDev Logic sections — biggest time pressure)
- Number series: find the rule (add, multiply, alternating, differences of differences).
- Basic arithmetic, ratios, percentages, speed = distance/time.
- **Strategy:** move fast, flag hard ones, come back. Don't burn 3 min on one question.

---

## PART 2 — Your STAR Stories (from real experience)
> STAR = Situation, Task, Action, Result. Say them out loud until they're natural — don't memorize word-for-word. Each is ~45–60 sec.

### Story A — "Tell me about something impactful you built" (AI + automation)
- **S:** At ATS Share Brokers, customer support was slow — agents manually handled repetitive client queries.
- **T:** I was asked to reduce support response time without adding headcount.
- **A:** I built an AI-assisted support automation using OpenClaw AI for intelligent query handling and automated ticket resolution, plus a real-time chat layer over WebSockets and the WhatsApp Business API for instant client replies.
- **R:** Cut response time by ~60% and freed the team to focus on complex cases. **(Metric + ownership.)**

### Story B — "A technical challenge you solved" (performance)
- **S:** Some PostgreSQL-backed queries in our fintech app were getting slow as data grew.
- **T:** Improve query performance without a schema rewrite.
- **A:** I redesigned the schema and added targeted indexing strategies based on the actual query patterns, and measured before/after.
- **R:** Query performance improved ~30%. Taught me to profile first, then optimize the real bottleneck.

### Story C — "Working with complex/external systems" (fintech domain — USE THIS for NextAlphaAI)
- **S:** We needed compliant digital onboarding for a stock brokerage.
- **T:** Integrate third-party fintech services for e-KYC and depository operations.
- **A:** I built RESTful APIs in Django/FastAPI integrating **Digio** (e-sign / digital KYC) and **CDSL** (depository), and automated daily **NSCCL** F&O settlement-file retrieval via browser automation.
- **R:** Reliable, compliant onboarding + back-office automation. **This is your fintech credibility — lean on it hard for NextAlphaAI (Mobile Fintech).**

### Story D — "Initiative / going beyond the task" (security + AI tooling)
- **S:** Across 21 repos there was risk of credentials leaking into commits.
- **T:** No one asked me to, but I saw the exposure.
- **A:** I built internal AI-assisted developer tooling (Claude Code) — a pre-commit secret-scanning hook that blocks AWS/GitHub/API-key leaks, plus a cross-repo change-impact and security-review workflow.
- **R:** Prevented credential leaks proactively; showed ownership beyond my assigned work.

### "Why this role?" (NextAlphaAI)
> "I've spent the past year building full-stack, real-time systems specifically in the fintech/brokerage domain — e-KYC, depository integrations, WebSocket messaging. NextAlphaAI's mobile-fintech focus lines up almost exactly with what I've shipped, and I'm excited to bring that domain knowledge to a product being built AI-first, which is how I already work day to day."

---

## PART 3 — NextAlphaAI AI interview — keyword & delivery kit
Role: **Full Stack / Front End Engineer (Mobile Fintech)**. The AI transcribes you and keyword-matches. Weave these in *naturally* (don't list them):
`React` · `full-stack` · `REST APIs` · `FastAPI / Django` · `responsive UI` · `WebSockets / real-time` · `fintech` · `e-KYC` · `authentication (JWT)` · `PostgreSQL` · `AI-first`

### Your 60–90 sec intro (rehearse out loud x2)
> "I'm Vashu, a full-stack developer with about a year of professional experience at a fintech stock brokerage in Bengaluru. On the frontend I work in React and Tailwind; on the backend, FastAPI, Django, and Node with PostgreSQL and MongoDB. What's most relevant here is that I've built production fintech systems — real-time chat over WebSockets, WhatsApp Business API integration, and compliant onboarding through Digio e-KYC and CDSL depository APIs. I also build AI-assisted developer tooling as part of my daily workflow, so an AI-first product feels natural to me. Outside work I'm finishing my MCA and keep building side projects like an AI code reviewer using Gemini."

### Delivery checklist
- [ ] Quiet room, door shut, phone silent
- [ ] Light **facing you** (window/lamp behind webcam), not behind you
- [ ] Headphones or a decent mic; test audio first
- [ ] **Look at the camera lens**, not your own video
- [ ] Energy ~110% — video flattens you; smile at the start
- [ ] Speak in full sentences; pause to think instead of "um/uh/like"
- [ ] Have water nearby; keep answers ~60–90 sec, then stop

---

## Suggested order
1. **NextAlphaAI first** — 24h clock. Do the delivery checklist + rehearse intro, then take it.
2. **BairesDev** — block a quiet 2h slot when fresh. Warm up: 20 min JS review + 20 numerical-series practice questions under a timer, then start.

You've shipped real production fintech software in a year. These are checking for exactly what you already do. Go in calm.
