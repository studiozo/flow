# Claude Skills Index -- Your Current Installation

> Generated: 2026-02-21
> Marketplace: `anthropics/claude-plugins-official`
> Location: `~/.claude/plugins/marketplaces/claude-plugins-official/`

---

## Installation Status

- **Marketplace**: `claude-plugins-official` (from `github.com/anthropics/claude-plugins-official`)
- **Last updated**: 2026-02-21
- **Blocklisted**: `code-review` (test), `fizz@testmkt-marketplace` (security test)

---

## Active MCP Connections (This Session)

These are the MCP servers currently connected and available:

| MCP Server | Provider | Capabilities |
|-----------|----------|-------------|
| **TouchDesigner** | Custom | Execute Python scripts, create/delete nodes, manage parameters, inspect errors, browse TD classes |
| **Claude in Chrome** | Extension | Full browser automation: click, type, screenshot, navigate, read pages, GIF recording |
| **Control Chrome** | Extension | Tab management, JS execution, page content extraction |
| **Read/Send iMessages** | Local | Search contacts, read/send iMessages |
| **Figma** | Extension | Design context, screenshots, metadata, variables, code connect |
| **Vibe Prospecting (Explorium)** | Cloud | Business/prospect matching, enrichment, events, statistics, CSV export |
| **Spotify** | AppleScript | Playback control, volume, shuffle, repeat, track info |
| **Desktop Commander** | Local | File ops, process management, search, PDF creation, terminal sessions |
| **Context7** | Cloud | Library documentation lookup with version-specific docs and code examples |
| **MCP Registry** | Cloud | Discover and suggest new MCP connectors |

---

## Installed Plugins -- Official Marketplace

### Development Workflow

| # | Plugin | Description | Type |
|---|--------|-------------|------|
| 1 | **feature-dev** | Full feature dev workflow with explorer, architect, and reviewer agents | Agents + Command |
| 2 | **commit-commands** | Streamlined git commit, push, and PR workflow | Commands |
| 3 | **code-review** | Multi-agent code review with confidence scoring | Agents (BLOCKLISTED - test) |
| 4 | **pr-review-toolkit** | PR review agents: comments, tests, errors, types, quality, simplification | Agents |
| 5 | **ralph-loop** | Continuous self-referential AI loops for iterative development | Skill |

### Code Quality

| # | Plugin | Description | Type |
|---|--------|-------------|------|
| 6 | **code-simplifier** | Simplifies code for clarity, consistency, maintainability | Agent |
| 7 | **security-guidance** | Security warning hook for command injection, XSS, unsafe patterns | Hook |

### Skills & Plugin Creation

| # | Plugin | Description | Type |
|---|--------|-------------|------|
| 8 | **skill-creator** | Create, improve, eval, and benchmark skills | Skill + Agents |
| 9 | **claude-code-setup** | Analyze codebases, recommend hooks/skills/MCPs/subagents | Skill |
| 10 | **hookify** | Create hooks by analyzing conversation patterns | Skill |
| 11 | **example-plugin** | Reference example demonstrating all plugin extension types | Example |

### Project Management

| # | Plugin | Description | Type |
|---|--------|-------------|------|
| 12 | **claude-md-management** | Audit, capture learnings, maintain CLAUDE.md files | Skill |

### Output Styles

| # | Plugin | Description | Type |
|---|--------|-------------|------|
| 13 | **explanatory-output-style** | Educational insights about implementation choices and patterns | Style |
| 14 | **learning-output-style** | Interactive learning mode requesting contributions at decision points | Style |

### UI/UX

| # | Plugin | Description | Type |
|---|--------|-------------|------|
| 15 | **frontend-design** | Frontend design skill for UI/UX implementation | Skill |
| 16 | **playground** | Interactive HTML playgrounds with visual controls and live preview | Skill |

### SDK & Advanced

| # | Plugin | Description | Type |
|---|--------|-------------|------|
| 17 | **agent-sdk-dev** | Claude Agent SDK development plugin | Skill |

---

## External Plugin Integrations (Available to Install)

These are in the marketplace but install MCP servers / external connections:

| # | Plugin | Provider | Description |
|---|--------|----------|-------------|
| 1 | **context7** | Upstash | Version-specific library documentation lookup |
| 2 | **github** | GitHub | Full GitHub API: issues, PRs, repos, code search |
| 3 | **gitlab** | GitLab | DevOps: repos, MRs, CI/CD, issues, wikis |
| 4 | **playwright** | Microsoft | Browser automation and E2E testing |
| 5 | **supabase** | Supabase | Database, auth, storage, realtime |
| 6 | **firebase** | Google | Firestore, auth, functions, hosting, storage |
| 7 | **slack** | Slack | Workspace messaging: search, channels, threads |
| 8 | **stripe** | Stripe | Payments, webhooks, API, security |
| 9 | **linear** | Linear | Issue tracking and project management |
| 10 | **asana** | Asana | Task and project management |
| 11 | **greptile** | Greptile | AI code review for GitHub/GitLab PRs |
| 12 | **serena** | Oraios | Semantic code analysis via LSP |
| 13 | **laravel-boost** | Laravel | Laravel dev toolkit: Artisan, Eloquent, routing |

---

## LSP Plugins (Language Server Protocol)

Available in the marketplace for language-specific intelligence:

| Plugin | Language |
|--------|----------|
| **typescript-lsp** | TypeScript/JavaScript |
| **pyright-lsp** | Python |
| **gopls-lsp** | Go |
| **rust-analyzer-lsp** | Rust |
| **kotlin-lsp** | Kotlin |
| **swift-lsp** | Swift |
| **php-lsp** | PHP |
| **jdtls-lsp** | Java |
| **clangd-lsp** | C/C++ |
| **lua-lsp** | Lua |
| **csharp-lsp** | C# |

---

## Not Yet Installed (Recommended Additions)

| Plugin/Tool | What It Does | How to Get |
|------------|-------------|-----------|
| **Superpowers** | Structured dev: TDD, planning, subagents, code review | `/plugin marketplace add obra/superpowers-marketplace` then `/plugin install superpowers` |
| **Rube MCP** | Connect to 500+ SaaS apps via single MCP endpoint | `claude mcp add --transport http rube -s user "https://rube.app/mcp"` |
| **Ableton MCP** | Control Ableton Live from Claude | `npx -y @smithery/cli install @ahujasid/ableton-mcp --client claude` |

---

## Quick Reference: Plugin Locations

```
~/.claude/
├── settings.json                          # Global permissions
├── plugins/
│   ├── blocklist.json                     # Disabled plugins
│   ├── known_marketplaces.json            # Registered marketplaces
│   └── marketplaces/
│       └── claude-plugins-official/       # Official Anthropic marketplace
│           ├── plugins/                   # First-party plugins (17)
│           └── external_plugins/          # Third-party integrations (13)
├── skills/                                # Personal standalone skills (empty)
├── commands/                              # Personal slash commands (empty)
└── projects/                              # Per-project configs
    └── <project>/
        └── memory/MEMORY.md              # Auto-memory per project
```

---

## Counts Summary

| Category | Count |
|----------|-------|
| First-party plugins | 17 |
| External plugin integrations | 13 |
| LSP plugins | 11 |
| Active MCP connections | 10 |
| Custom/personal skills | 0 |
| Blocklisted plugins | 2 |
| **Total available in marketplace** | **41** |
