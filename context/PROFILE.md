# Master Profile — Vashu Singh

> Single source of truth for the job search. Resumes, cover letters, and application answers are
> generated from here. Keep it current. (All `<TODO>`s filled as of 2026-07-16 — MCA institute/year and
> both project links.)

## Contact
- **Name:** Vashu Singh
- **Title:** Full Stack Developer
- **Email:** rajputvashusingh@gmail.com  _(personal — use for all applications)_
- **Phone:** 9380892737
- **Location:** Bengaluru, India
- **LinkedIn:** https://www.linkedin.com/in/vashu-singh/
- **GitHub:** https://github.com/Vashu2003

## Target
- **Job titles:** Full Stack Developer; also Frontend (React) Developer, Backend/Python Developer (FastAPI/Django)
- **Location preference:** Bengaluru (on-site / hybrid)
- **Experience level:** ~1 year (Full Stack Developer since Aug 2025)
- **Current compensation:** 3 LPA
- **Salary expectation:** 7 LPA (negotiable band 6–8 LPA)
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

### Full Stack Developer — ATS Share Brokers (Aug 2025 – Present)
*Bengaluru, Karnataka, India*
- Automated customer-support operations using OpenClaw AI, cutting response time by 60% via intelligent
  query handling and automated ticket resolution.
- Developed real-time chat applications using WebSockets for live messaging and WhatsApp Business API for
  automated, instant client replies.
- Designed PostgreSQL schemas and indexing strategies that improved query performance by 30%.
- Built RESTful APIs in Django/FastAPI integrating third-party fintech services — Digio (e-sign/digital KYC)
  and CDSL (depository).
- Built internal AI-assisted developer tooling (Claude Code) across 21 repos — custom automation skills,
  git hooks, and a cross-repo change-impact and security-review workflow.
- Automated back-office operations (daily NSCCL F&O settlement-file retrieval via browser automation) and a
  pre-commit secret-scanning hook that blocks credential leaks (AWS/GitHub/API keys).

## Projects

### AI Code Reviewer — React, Tailwind, FastAPI, Docker, Google Gemini AI
- Full-stack code-review platform integrating Google Gemini AI for real-time Python/JavaScript analysis with
  bug detection, efficiency scoring, and auto-corrections.
- Responsive UI with Monaco Editor and Chart.js; sample-answer management and history tracking.
- Deployed with Docker (frontend on Netlify, backend on Railway).
- **Link:** https://github.com/Vashu2003/AI-Code-Reviewer

### HCP CRM — AI Agent for Pharma Field Sales — React/Redux, FastAPI, PostgreSQL, LangGraph, Groq LLM
- AI-first CRM module for pharma field reps: a split-view "Log Interaction" screen where the rep describes a
  visit in plain language ("Met Dr. Sharma, discussed Xarelto, positive, follow up next week") and a LangGraph
  agent (5 tools, Groq LLM) fills the structured form in real time — HCP, product, channel, sentiment, follow-up.
- Full-stack: FastAPI backend, PostgreSQL, React/Redux frontend.
- **Link:** https://github.com/Vashu2003/hcp-crm-ai-agent

### codebase-rag — FastAPI, Chroma, Next.js, Ollama / Gemini
- AST-aware RAG system that answers plain-English questions about any codebase with `file:line` citations
  ("Where is auth handled?", "What breaks if I change this endpoint?").
- Runs fully free and offline (local embeddings + Ollama) or against Gemini's free tier for higher-quality
  answers; includes a CI pipeline.
- **Link:** https://github.com/Vashu2003/codebase-rag

### Compliance Drift Sentinel — FastAPI, DataHub, AI Agents (hackathon build)
- Built for "Build with DataHub: The Agent Hackathon" (Open/Wildcard track): an AI agent that reads DataHub's
  column-level data lineage to predict which downstream report field breaks when an upstream schema changes,
  then writes a proposed data contract back to the graph.
- Fintech/compliance-adjacent data-integrity problem — ties directly to the brokerage domain background.
- **Link:** https://github.com/Vashu2003/compliance-drift-sentinel

### Claude Job-Hunt Agent — Python, Claude Code, Telegram Bot, Gmail API, Browser Automation
- An autonomous LLM-agent system (built on Claude Code) that discovers and scores job postings against a
  candidate profile, with a human-in-the-loop Telegram approval flow, safety rails (rate limits, quiet hours,
  kill switch), and Gmail reply-tracking — a real production agent, not a toy demo.
- Demonstrates practical agentic-AI engineering: tool orchestration, structured scoring, and safe autonomous
  operation with human oversight built in.
- **Link:** https://github.com/Vashu2003/claude-job-hunt-agent

## Education
- **Master of Computer Applications (MCA)** — Sikkim Skill University, (pursuing — final year, expected Jul–Sept 2027)
- **Bachelor of Computer Application (BCA)** — Sambhram Academy of Management Studies, Bengaluru (Sep 2022 – Sep 2025)

## Achievements & Leadership
- **Rajya Puraskar Award** — National-level Hindustan Scouts & Guides recognition for leadership and service.
- **Athletics** — 1st in 100m, 2nd in Throw Ball at inter-college competition.

## Notes for tailoring
- For **frontend roles:** lead with React/Tailwind, AI Code Reviewer, Monaco/Chart.js UI work; HCP CRM's
  React/Redux frontend as a secondary example.
- For **backend/Python roles:** lead with FastAPI/Django REST APIs, PostgreSQL indexing, fintech integrations;
  codebase-rag (FastAPI + Chroma) as a backend-heavy AI project.
- For **full-stack roles:** lead with the ATS Share Brokers experience end-to-end + HCP CRM AI Agent
  (FastAPI + React/Redux + LangGraph).
- For **AI/agentic roles** (increasingly common in the pipeline): lead with claude-job-hunt-agent (production
  autonomous LLM agent, human-in-the-loop, safety rails) + codebase-rag (AST-aware RAG) + HCP CRM (LangGraph
  tool-use agent) — this is now the strongest differentiator, not an afterthought.
- Fintech/brokerage domain (Digio, CDSL, NSCCL) is a differentiator for fintech employers; compliance-drift-
  sentinel adds a second fintech/data-integrity angle.
- AI tooling experience (Claude Code, Gemini, OpenAI, LangGraph) is a strong angle for AI-forward startups —
  now backed by real shipped agent projects, not just tool familiarity.
- Note: AI Code Reviewer (kept above) is also ~1yr old (pushed 2025-07-05) — still solid and already properly
  linked, but if a 5th project slot opens up, codebase-rag or HCP CRM are more current alternatives.
