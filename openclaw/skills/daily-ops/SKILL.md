# Daily Operations Manager

## Description
Central task management and daily operations for ZØ Studio. Manages tasks, tracks projects, and keeps things moving.

## Triggers
- "what's on my plate", "tasks", "to do", "status update"
- "add task", "complete task", "priority list"
- "morning briefing", "end of day summary"

## Task Storage
Tasks are stored in `memory/tasks.md` using this format:

```markdown
## Active Tasks
- [ ] [P1] Task description — @project — due: YYYY-MM-DD
- [x] [P2] Completed task — @project — done: YYYY-MM-DD

## Someday / Maybe
- Task idea for later

## Completed (Last 7 Days)
- [x] Task — completed YYYY-MM-DD
```

## Priority Levels
- **P1:** Revenue-critical or time-sensitive. Do today.
- **P2:** Important but not urgent. Do this week.
- **P3:** Nice to have. Do when bandwidth allows.

## Daily Flow
- **8 AM:** Morning briefing (via heartbeat) — today's tasks + overnight alerts
- **On demand:** Add/update/complete tasks via message
- **6 PM (optional):** End-of-day summary — what got done, what carries over

## Projects
Track tasks against these ZØ projects:
- @oculus — AR/VR development
- @moda — ModA NYC fashion
- @shopify — E-commerce operations
- @social — Social media & content
- @studio — General studio ops

## Safety
- Task management is fully autonomous (read + write to memory/)
- Sending summaries/reminders is autonomous
- Any action OUTSIDE of task tracking requires appropriate skill handoff
