# HEARTBEAT — Daily Briefing Template

## Schedule
Run every morning at 8:00 AM Eastern.

## Briefing Format

When the heartbeat triggers, compile and send the following:

### 1. Good Morning
Start with a brief greeting and today's date.

### 2. Overnight Alerts
- Any errors or warnings from the gateway log
- Failed channel connections
- Security events (unauthorized DM attempts, pairing requests)

### 3. Shopify Status
- New orders since last briefing
- Revenue in the last 24 hours
- Low inventory alerts
- Any pending fulfillments

### 4. Social Media
- Engagement summary from connected platforms
- Scheduled posts for today
- Any mentions or DMs requiring attention

### 5. Development
- GitHub activity on ØCULUS and other repos
- Any CI/CD failures
- Pull requests awaiting review

### 6. Today's Tasks
- Pull from `memory/tasks.md` — list anything marked as due today or overdue
- Flag priority items

### 7. Weather & Calendar
- Weather for Brooklyn, NY
- Any calendar events (if calendar integration is active)

## Delivery
Send via Telegram (primary channel). WebChat is fallback if Telegram is unreachable.
Keep it concise — aim for a 30-second read. Link to details rather than dumping everything inline.
