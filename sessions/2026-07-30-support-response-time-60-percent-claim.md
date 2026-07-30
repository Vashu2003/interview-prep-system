# Session: 2026-07-30 - Support response-time 60 percent claim

```yaml
date: 2026-07-30
mode: Core Interview Readiness
topic: Support response-time 60 percent claim
energy: high
status: attempted
revision_done: true
quality_score: 4
readiness_delta: 2
tags:
  - support-automation
  - ai
  - websocket
  - django
  - resume-defense
```

## Revision

Core topics revised for 5-10 minutes:
- 30% PostgreSQL query improvement claim: leads table, filters such as state/city/income range, composite index, Postman before/after timing, index write-cost tradeoff.
- Profile attack points: numerical claims and production integrations are the highest-risk interview follow-ups.

## Teaching Notes

What was taught:
- Interview answer structure for the 60% support response-time claim: old support workflow -> bottleneck -> automation built -> technical flow -> measurement -> safety/fallback.
- Strong wording for average first-response time vs full issue-resolution time.
- OpenClaw as AI gateway integrated with LLM and controlled knowledge base/routing rules.
- Existing system shape: Django backend owned APIs, DB, and ticketing; FastAPI WebSocket microservice handled real-time chat updates.
- WebSocket service used DB change events/triggers on chat table inserts/updates to push payloads to frontend.
- OpenClaw/AI listened to the same new-message event stream for customer messages.
- AI routing paths: direct knowledge-base answer, ticket creation, or human handoff.
- Ticket creation through controlled Django APIs rather than direct LLM database writes.
- Safety framing: AI should answer low-risk factual service questions, not account-specific/sensitive financial queries.
- Deduplication: WhatsApp message ID check before insert prevented duplicate webhook events from creating duplicate AI replies.
- Loop prevention: AI responded only to incoming messages with status `received`, not outgoing `sent`, `delivered`, or `read` messages.

## Grill

Questions asked:
1. What do you currently remember about the 60% support response-time reduction work?
2. What exactly triggered the AI to respond?
3. How did the system decide between answer directly, create a ticket, or handoff to human?
4. Where was the ticket actually stored?
5. How did you decide severity/criticality?
6. How did you measure the 60% response-time reduction?
7. Was the 60% reduction measured across all chats or only AI-handled categories?
8. What was the fallback when the AI was unsure?
9. What safeguards prevented hallucination or wrong support answers?
10. What was the WebSocket microservice responsibility compared to the Django backend?
11. How did the WebSocket microservice communicate with the Django backend?
12. Did OpenClaw listen to the same chat events or receive forwarded events?
13. How did you prevent the AI from responding to its own messages?
14. If the same DB/webhook event was delivered twice, what prevented duplicate AI responses?
15. What was measured: first response time or full resolution time?
16. Was the AI response sent directly or reviewed by a human first?
17. What questions were safe for direct AI replies?
18. What questions should not be answered directly by AI?
19. How did you ensure AI did not expose sensitive customer data?
20. What ticket fields did the AI send to the Django ticket API?
21. How did the AI know which department to choose?

Answers given:
- Before automation, customer support executives manually answered repetitive WhatsApp/web-chat queries throughout the day.
- Existing system had WhatsApp API integration in Django, chat storage in the DB, and a separate FastAPI WebSocket service for real-time chat.
- OpenClaw was integrated as an AI gateway connected to an LLM, a company/service knowledge base, WebSocket events, and internal APIs.
- AI was triggered on every new customer message coming through the WebSocket/chat event flow.
- AI answered generic company/service questions from the knowledge base, created tickets for complaint/service issues, and handed off vague/unsupported messages to human support.
- Ticketing lived inside the same Django project and database; AI interacted through APIs, not direct DB writes.
- Ticket fields included title, department, description, and client code.
- Department routing was keyword-based.
- Severity was based on keywords, department, time sensitivity, and a basic tone-analysis signal.
- Response-time measurement used chat DB timestamps before and after automation, comparing average first-response time.
- Measurement was across all chats in the same support channel; the biggest improvement came from repetitive queries and complaint intake.
- Safe direct answers included factual service/pricing questions like brokerage charges, DP charges, and research-pack pricing.
- Account-specific questions such as current holdings should not be answered directly by AI.
- Sensitive customer/account data was not given to the AI; it did not have direct access to holdings, balances, KYC documents, or account-level data.
- The WhatsApp webhook payload was sent to OpenClaw; it mostly contained message metadata, message text, timestamp, status, and client phone number. Future hardening should minimize the payload.
- WebSocket service listened to DB change events/triggers on chat rows and pushed updates to frontend.
- AI/OpenClaw listened to the same new-message event stream.
- Loop prevention used message status: only `received` incoming messages triggered AI replies; outgoing `sent`, `delivered`, and `read` messages did not.
- Duplicate webhook handling used WhatsApp message ID as a dedupe key before saving the message row.

## Polished 60-Second Answer

We had a support bottleneck where executives had to manually respond to repetitive customer queries throughout the day. I built an AI-assisted support automation around our existing Django system, where WhatsApp chat messages were already stored in our database. We had a FastAPI WebSocket service for real-time chat updates, and I integrated OpenClaw as an AI gateway connected to an LLM and a controlled company knowledge base. When a new customer message came in, the system could answer generic service questions, create tickets for complaint-related issues, route them to departments like accounts or compliance, or escalate to a human agent when it was unsure. We measured impact using the chat table timestamps, comparing average first-response time before and after automation. That reduced first-response time by around 60%. It did not remove humans from the loop; it reduced repetitive work and gave customers faster acknowledgement.

## Score

Quality score: 4/5

What worked:
- Remembered the real architecture and could explain the role of Django, FastAPI WebSockets, WhatsApp API, OpenClaw, and ticketing.
- Correctly narrowed the 60% metric to average first-response time, not full resolution time.
- Gave concrete examples of safe direct answers and sensitive questions that should be escalated.
- Had strong implementation details for loop prevention and duplicate-message prevention.
- Did not overclaim that the AI fully replaced human support.

Weak spots:
- Initial explanation was a memory dump and needed structure.
- Some wording needs polish: WebSocket, description, read, reduced response time.
- Payload minimization/security answer needs maturity: actual implementation sent full webhook payload, but future hardened design should strip unnecessary fields.
- Department keyword examples were not remembered beyond general keyword-based routing.

## Next Actions

- Add the polished 60-second support-automation answer to the Answer Bank in `context/recovered-interview-prep-tracker.md`.
- Prepare a 2-minute deep version with architecture and safety tradeoffs.
- Next Core session: Core 5 - WebSocket real-time chat, per SYLLABUS.md Recommended First 10 Sessions.

## Commit

Committed: yes
