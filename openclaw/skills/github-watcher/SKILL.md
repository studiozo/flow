# GitHub Repository Watcher

## Description
Monitor ZØ Studio GitHub repositories for activity, PRs, issues, and CI/CD status.

## Triggers
- "github status", "check repos", "any new PRs", "build status"
- "ØCULUS update", "dev status"
- Heartbeat: included in daily morning briefing

## Monitored Repos
Configure in the repos list below. Add/remove as needed:
- ØCULUS (primary development project)
- Any other ZØ Studio repositories

## Actions

### Activity Summary
- New commits in last 24 hours
- Open pull requests and their status
- Open issues, sorted by priority labels
- CI/CD pipeline status (passing/failing)

### PR Review
When asked to review a PR:
1. Fetch the diff
2. Summarize changes
3. Flag potential issues (breaking changes, missing tests, security concerns)
4. Provide review comments (but don't submit — present for human review)

### Issue Triage
When new issues come in:
1. Categorize (bug, feature, question, documentation)
2. Suggest priority label
3. Recommend assignee if team context is available

## Environment Variables Required
- `GITHUB_TOKEN`

## Safety
- READ operations (status, diffs, issues) are autonomous
- WRITE operations (comments, merges, releases) require human confirmation
- Never force-push or delete branches without explicit approval
