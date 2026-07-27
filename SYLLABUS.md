# Interview Prep Syllabus

This syllabus controls the direction of the prep system. LLMs should not invent a new path unless the user explicitly changes the target.

## Modes

### Mode 1: Core Interview Readiness

Purpose: make Vashu interview-ready from `context/PROFILE.md`.

This mode has priority over Broad Concept Coverage.

Use this mode when:
- the topic appears directly in the profile/resume
- the topic helps defend a resume claim
- the topic is likely in a full-stack, backend Python, frontend React, fintech, or AI-agent interview
- the user has an active interview or role target

### Mode 2: Broad Concept Coverage

Purpose: build full-stack development breadth that supports interviews but is not the main profile-defense path.

Use this mode when:
- Core work is stalled or low-energy
- the user asks for a general concept
- the concept is useful for full-stack interviews but not central to the profile

Do not let Broad mode replace Core readiness.

## Session Shape

Every session follows this order:

1. Ask for energy: `low`, `medium`, or `high`.
2. Do 5-10 minutes of Core revision.
3. Teach the selected topic.
4. Grill after teaching.
5. Score the answer.
6. Log the attempt in `sessions/`.
7. Update analytics and context if tools are available.

Energy adaptation:
- `low`: one small subtopic, light teaching, 2-4 grill questions
- `medium`: one normal topic, moderate teaching, 4-7 grill questions
- `high`: deeper topic, follow-up drilling, answer-bank improvement

## Core Interview Readiness Syllabus

### Core 0: Profile Map

Goal: know what claims the profile makes and what interviewers can challenge.

Must cover:
- full-stack profile summary
- target roles
- strongest profile differentiators
- fintech brokerage experience
- AI-assisted tooling angle
- current projects and links

Done when:
- Vashu can give a 60-90 second "tell me about yourself" answer.
- Vashu can name the top 5 likely follow-up areas.

### Core 1: Resume Claim Defense

Goal: defend every major profile claim with specifics.

Must cover:
- 60% support response-time reduction
- 30% PostgreSQL query performance improvement
- Digio e-sign / digital KYC integration
- CDSL depository integration
- WebSocket real-time chat
- WhatsApp Business API automation
- NSCCL settlement-file automation
- pre-commit secret scanning
- Claude Code / AI tooling across 21 repos

Done when:
- each claim has a 60-second answer
- each claim has a 2-minute deep answer
- each claim survives follow-up questions about implementation, measurement, tradeoffs, and failure handling

### Core 2: SQL, PostgreSQL, and Indexing

Goal: make the 30% query improvement claim credible.

Must cover:
- slow query diagnosis
- joins
- B-tree indexes
- composite indexes
- covering indexes
- `EXPLAIN`
- `EXPLAIN ANALYZE`
- N+1 queries
- schema design basics
- before/after measurement

Done when:
- Vashu can explain exactly why an index helped.
- Vashu can answer "how did you measure 30%?"
- Vashu can reason about a simple query plan.

### Core 3: FastAPI and Django Backend Depth

Goal: prepare for backend framework interviews.

Must cover:
- REST APIs
- FastAPI dependency injection
- Pydantic validation
- async endpoints
- Django ORM
- migrations
- DRF serializers
- JWT authentication
- error handling
- logging

Done when:
- Vashu can design and explain a small production API.
- Vashu can compare FastAPI and Django usage from experience.

### Core 4: Python for Backend Interviews

Goal: refresh Python topics that matter for backend/full-stack interviews.

Must cover:
- data model / dunders
- decorators
- generators
- iterators
- context managers
- exceptions
- GIL
- `asyncio`
- event loop
- async I/O vs threads

Done when:
- Vashu can explain Python async in relation to FastAPI/WebSockets.
- Vashu can answer common Python follow-ups without vague definitions.

### Core 5: WebSockets and Real-Time Systems

Goal: defend real-time chat experience.

Must cover:
- WebSocket handshake
- connection lifecycle
- auth for WebSocket connections
- message routing
- reconnect handling
- heartbeats/ping-pong
- scaling with multiple workers
- pub/sub concept
- WhatsApp Business API role

Done when:
- Vashu can draw/explain the message flow.
- Vashu can answer "what breaks at scale?"

### Core 6: Fintech Integrations

Goal: show credible fintech domain experience.

Must cover:
- Digio e-sign / KYC flow
- CDSL integration purpose
- REST API contracts
- authentication
- retries and failures
- audit logging
- sensitive-data handling
- settlement-file automation context

Done when:
- Vashu can explain the business purpose and technical flow without exposing confidential details.

### Core 7: JavaScript and React

Goal: prepare for full-stack/frontend interview basics.

Must cover:
- `var` / `let` / `const`
- closures
- `this`
- promises
- JS event loop
- array methods
- React components
- props/state
- `useState`
- `useEffect`
- reconciliation and keys
- controlled inputs
- API calls and loading/error states

Done when:
- Vashu can answer JS/React fundamentals with examples.
- Vashu can explain one frontend project from the profile.

### Core 8: Projects Deep Dive

Goal: defend current projects from `context/PROFILE.md`.

Must cover:
- AI Code Reviewer
- HCP CRM AI Agent
- codebase-rag
- Compliance Drift Sentinel
- Claude Job-Hunt Agent

Done when:
- each project has a problem, architecture, stack, tradeoff, and demo-style explanation
- Vashu can answer "what was hard?" and "what would you improve?"

### Core 9: DSA for Interviews

Goal: maintain enough DSA readiness for junior interviews.

Must cover:
- hashing
- two pointers
- sliding window
- stack/queue
- linked list
- trees
- recursion basics
- DP basics
- Big-O

Done when:
- Vashu can solve and explain one problem per active pattern.
- Vashu can state time and space complexity.

### Core 10: Behavioral and Communication

Goal: prepare clear interview delivery.

Must cover:
- tell me about yourself
- why this role
- why leaving / why switching
- STAR stories
- failure story
- conflict story
- learning story
- questions to ask interviewer

Done when:
- Vashu has 6-8 reusable STAR stories.
- Answers sound specific and not memorized.

## Broad Concept Coverage Syllabus

### Broad 1: Backend Production Concepts

Must cover:
- authentication vs authorization
- sessions vs JWT
- rate limiting
- pagination
- filtering
- background jobs
- caching
- file uploads
- API documentation
- API testing

### Broad 2: Frontend Production Concepts

Must cover:
- component structure
- form validation
- client-side routing
- state management basics
- loading states
- empty states
- error states
- accessibility basics
- frontend performance basics

### Broad 3: Database and Data Modeling

Must cover:
- ACID
- transactions
- isolation levels
- normalization
- denormalization
- constraints
- migrations
- indexes recap

### Broad 4: Networking and Web Basics

Must cover:
- HTTP methods
- status codes
- headers
- cookies
- CORS
- TLS/HTTPS
- TCP vs UDP
- request lifecycle

### Broad 5: DevOps and Deployment Basics

Must cover:
- Git workflows
- environment variables
- Docker basics
- CI/CD basics
- logs
- monitoring
- rollback thinking

### Broad 6: Security Basics for Full-Stack

Must cover:
- password hashing
- secrets management
- SQL injection
- XSS
- CSRF
- auth failures
- input validation
- least privilege

### Broad 7: Testing and Debugging

Must cover:
- unit tests
- integration tests
- API tests
- frontend tests
- debugging workflow
- reading logs
- reproducing bugs

### Broad 8: AI-Adjacent Full-Stack

Must cover:
- LLM API calls
- prompt handling
- embeddings
- RAG basics
- tool calling
- agent safety basics
- evaluation basics

## Anti-Drift Rules

Do not prioritize these unless the user asks or a job requires them:
- deep competitive programming
- deep system design for senior roles
- advanced TypeScript
- advanced Next.js
- cloud-provider-specific certifications
- unrelated CS theory

If unsure, prefer Core Interview Readiness.

## Recommended First 10 Sessions

1. Core 2: SQL/indexing and the 30% query claim
2. Core 1: 60% support response-time claim
3. Core 5: WebSocket real-time chat
4. Core 6: Digio/CDSL fintech integrations
5. Core 3: FastAPI dependency injection and Pydantic
6. Core 3: Django ORM, migrations, DRF serializers
7. Core 4: Python async and event loop
8. Core 7: JS promises, event loop, React hooks
9. Core 8: HCP CRM AI Agent deep dive
10. Core 10: Tell me about yourself + STAR story bank
