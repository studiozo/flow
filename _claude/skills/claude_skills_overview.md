# Claude Code Skills & Plugins -- Complete Overview

> Last updated: 2026-02-21

---

## Table of Contents

1. [What Are Claude Skills?](#what-are-claude-skills)
2. [Best Skills to Get](#best-skills-to-get)
3. [Rube MCP Connector](#rube-mcp-connector)
4. [Superpowers Framework](#superpowers-framework)
5. [How to Create Your Own Skills](#how-to-create-your-own-skills)
6. [Skills + MCPs: The Power Combo](#skills--mcps-the-power-combo)
7. [Ableton + Claude/MCP Integration](#ableton--claudemcp-integration)
8. [Resources & Links](#resources--links)

---

## What Are Claude Skills?

Claude Code has an extensibility system built on **plugins** (distribution packages) containing **skills** (auto-triggered capabilities), **commands** (slash commands), **agents** (subagent definitions), **hooks** (event handlers), and **MCP servers** (external tool integrations).

**Skills** are the core unit -- a `SKILL.md` file with YAML frontmatter that tells Claude *when* to activate and *what* to do. Claude reads the skill descriptions and autonomously decides when to apply them based on your task.

**Plugins** are the packaging format -- a directory with a `.claude-plugin/plugin.json` manifest that bundles one or more skills, commands, agents, hooks, and MCP configs for distribution.

### Skill Architecture (3-Level Progressive Disclosure)

```
Level 1: Metadata (always loaded)     ~100 words   -> Decides if skill triggers
Level 2: SKILL.md body (on trigger)   <5,000 words -> Core instructions
Level 3: references/, scripts/        Unlimited     -> Deep knowledge on demand
```

---

## Best Skills to Get

### Tier 1: Essential (Install These First)

| Plugin | What It Does | Install |
|--------|-------------|---------|
| **Superpowers** | Structured dev workflow: TDD, planning, code review, subagents | `/plugin marketplace add obra/superpowers-marketplace` then `/plugin install superpowers` |
| **skill-creator** | Create, test, and benchmark your own skills | Already in official marketplace |
| **claude-code-setup** | Analyzes your codebase, recommends hooks/skills/MCPs | Already in official marketplace |
| **feature-dev** | Full feature dev workflow with explorer, architect, reviewer agents | Already in official marketplace |
| **plugin-dev** | Reference guide for building plugins/skills/hooks | Already in official marketplace |

### Tier 2: Workflow Enhancers

| Plugin | What It Does |
|--------|-------------|
| **commit-commands** | Streamlined git commit/push/PR workflow |
| **code-review** | Multi-agent code review with confidence scoring |
| **pr-review-toolkit** | Specialized PR review agents (comments, tests, errors, types, quality) |
| **hookify** | Auto-create hooks from conversation patterns |
| **ralph-loop** | Continuous iterative dev loops (Ralph Wiggum technique) |
| **claude-md-management** | Audit and maintain your CLAUDE.md project memory |

### Tier 3: Style & Quality

| Plugin | What It Does |
|--------|-------------|
| **code-simplifier** | Simplifies and refines code for clarity |
| **security-guidance** | Warns about security issues when editing files |
| **explanatory-output-style** | Adds educational insights about implementation choices |
| **learning-output-style** | Interactive learning mode at decision points |
| **frontend-design** | UI/UX implementation guidance |
| **playground** | Creates interactive HTML playgrounds |

### Tier 4: External Integrations (MCP-Based)

| Plugin | What It Does |
|--------|-------------|
| **context7** | Up-to-date library documentation lookup |
| **github** | Full GitHub API (issues, PRs, repos) |
| **playwright** | Browser automation and E2E testing |
| **supabase** | Database, auth, storage, realtime |
| **firebase** | Firestore, auth, functions, hosting |
| **slack** | Workspace messaging integration |
| **stripe** | Payments and billing |
| **linear** | Issue tracking |
| **asana** | Project management |
| **gitlab** | DevOps platform |
| **greptile** | AI code review for PRs |
| **serena** | Semantic code analysis via LSP |

---

## Rube MCP Connector

### What It Is
**Rube** (by Composio) is a universal MCP server that connects Claude Code to **500+ SaaS apps** through a single endpoint. Instead of installing separate MCP servers for Gmail, Slack, Notion, Jira, Salesforce, etc., Rube dynamically loads only the tools needed per task.

### How It Works
```
You (natural language) -> Claude Code -> Rube MCP Server -> 500+ Apps
                                              |
                                    Meta-tools for context management:
                                    - Planner (multi-step tasks)
                                    - Search (find relevant tools)
                                    - Bash (shell commands)
                                    - Remote Workbench (large responses)
```

Key innovation: **dynamic tool loading** -- only fetches app connectors when needed, keeping Claude's context window clean.

### Install for Claude Code
```bash
claude mcp add --transport http rube -s user "https://rube.app/mcp"
```
Then in Claude Code: `/mcp` -> select "rube" -> authenticate via browser.

### What You Can Do
- "What are the subjects of my last 3 emails?"
- "Create a Jira ticket for this bug"
- "Post this update to Slack #engineering"
- "Add this to my Notion database"
- Cross-app workflows in a single conversation

### Status
- Currently **free** (beta)
- OAuth 2.1 with end-to-end encryption
- GitHub: `github.com/ComposioHQ/Rube`

---

## Superpowers Framework

### What It Is
**Superpowers** (by Jesse Vincent / `obra`) is an open-source agentic skills framework that enforces structured software development practices. Accepted into the official Anthropic plugin marketplace on Jan 15, 2026.

### The 7-Stage Development Pipeline

```
1. /brainstorming        -> Clarify goals before writing code
2. /using-git-worktrees  -> Isolate work in branches with test baselines
3. /writing-plans        -> Break work into 2-5 minute tasks
4. /execute-plan         -> Dispatch subagents per task with 2-stage review
5. /test-driven-development -> RED-GREEN-REFACTOR cycle
6. /requesting-code-review -> Review against the plan
7. /finishing-a-development-branch -> Verify, merge/PR, cleanup
```

### All Available Skills (Slash Commands)

**Planning & Execution:**
- `/brainstorming` -- Explore requirements before coding
- `/writing-plans` -- Create detailed implementation plans
- `/execute-plan` -- Run plans with review checkpoints
- `/dispatching-parallel-agents` -- Launch subagents for parallel work

**Development:**
- `/test-driven-development` -- Enforced TDD cycles
- `/using-git-worktrees` -- Isolated development branches
- `/finishing-a-development-branch` -- Final verification and merge

**Quality:**
- `/requesting-code-review` -- Review work against plan
- `/receiving-code-review` -- Process review feedback
- `/systematic-debugging` -- 4-phase root cause analysis
- `/verification-before-completion` -- Evidence-based completion verification

**Meta:**
- `/writing-skills` -- Create new custom skills
- `/using-superpowers` -- Introduction guide

### Install
```
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
```

### Key Principles
- Tests always written before implementation
- Break large tasks into small, verifiable units
- Evidence-based verification (never declare done without proof)
- MIT license, completely free

GitHub: `github.com/obra/superpowers`

---

## How to Create Your Own Skills

### Difficulty: Very Easy to Start

| Complexity | Time | What You Need |
|-----------|------|---------------|
| Basic skill | 5-10 min | 1 folder + 1 SKILL.md file |
| Full plugin | 30-60 min | plugin.json + skill folders |
| Production quality | Hours-Days | Testing, iteration, reference docs |

**If you can write markdown, you can create a skill.**

### Quickstart: Minimal Skill

```bash
# Create the skill directory
mkdir -p ~/.claude/skills/my-skill

# Create SKILL.md
cat > ~/.claude/skills/my-skill/SKILL.md << 'EOF'
---
name: my-skill
description: This skill should be used when the user asks to "do X", "handle Y", or discusses Z.
---

# My Skill

## Steps
1. First, do this
2. Then, do this
3. Finally, do this
EOF
```

That's it. Restart Claude Code and it auto-discovers the skill.

### Full Plugin Structure

```
my-plugin/
├── .claude-plugin/
│   └── plugin.json        # {"name":"my-plugin","description":"...","version":"1.0.0"}
├── skills/
│   └── my-skill/
│       ├── SKILL.md        # Core instructions
│       └── references/     # Deep docs loaded on demand
├── commands/
│   └── my-command.md       # Slash commands
├── agents/
│   └── my-agent.md         # Subagent definitions
├── hooks/
│   └── hooks.json          # Event handlers
└── .mcp.json               # MCP server config
```

### SKILL.md Frontmatter Reference

```yaml
---
name: skill-name                    # Display name / slash command
description: When to trigger        # CRITICAL -- determines auto-activation
version: 1.0.0                      # Semantic version
disable-model-invocation: false     # true = manual /name only
user-invocable: true                # false = background knowledge only
allowed-tools: [Read, Grep, Bash]   # Tools without permission prompts
model: haiku                        # Override model
context: fork                       # Run in subagent
agent: general-purpose              # Which subagent type
argument-hint: [issue-number]       # Autocomplete hint
---
```

### Writing Tips (from Anthropic's skill-creator)

1. **Description is everything** -- Make it slightly "pushy"; Claude under-triggers by default
2. **Use third person**: "This skill should be used when the user asks to..."
3. **Include trigger phrases** in quotes in the description
4. **Keep SKILL.md under 500 lines** -- use `references/` for overflow
5. **Explain WHY**, not just what -- Claude follows reasoning better than commands
6. **Use imperative form**: "Configure the server" not "You should configure the server"
7. **Target 1,500-2,000 words** for the body

### Testing

```bash
# Test locally with a plugin directory
claude --plugin-dir ./my-plugin

# Or place in ~/.claude/skills/ for auto-discovery
# Then invoke with /my-skill or let Claude auto-trigger
```

### The Skill Creator Plugin

Already installed in your marketplace. Use it for:
- **Create mode**: Interview -> research -> draft -> run -> refine
- **Eval mode**: Test skill on prompts, grade expectations
- **Improve mode**: Blind A/B comparison optimization
- **Benchmark mode**: Standardized performance measurement

### Official Docs

- Skills guide: `code.claude.com/docs/en/skills`
- Plugin guide: `code.claude.com/docs/en/plugins`
- Plugin reference: `code.claude.com/docs/en/plugins-reference`
- Marketplace guide: `code.claude.com/docs/en/plugin-marketplaces`
- Agent Skills open standard: `agentskills.io`
- Anthropic skills repo: `github.com/anthropics/skills`

---

## Skills + MCPs: The Power Combo

Skills and MCPs are complementary:
- **Skills** = instructions, workflows, methodology (what Claude *knows* how to do)
- **MCPs** = tool access, external connections (what Claude *can reach*)

### Best MCP + Skill Combos

| MCP Server | Pairs With | Use Case |
|-----------|-----------|----------|
| Rube (Composio) | Any skill | Connect 500+ apps to any workflow |
| Context7 | feature-dev, code-review | Always-fresh library docs |
| Playwright | frontend-design, playground | Browser testing + UI development |
| GitHub MCP | commit-commands, pr-review-toolkit | Full git workflow automation |
| Supabase/Firebase | feature-dev | Backend development |
| Ableton MCP | Custom music skill | AI-driven music production |
| TouchDesigner MCP | Custom visual skill | Real-time visual programming |

### Your Current MCP Connections (Active)

Based on your session, you already have:
- **TouchDesigner** -- Real-time visual programming
- **Claude in Chrome** -- Browser automation
- **Control Chrome** -- Chrome tab management
- **iMessages** -- Send/read messages
- **Figma** -- Design-to-code
- **Vibe Prospecting (Explorium)** -- Business intelligence
- **Spotify** -- Music playback control
- **Desktop Commander** -- File system + process management
- **Context7** -- Library documentation
- **MCP Registry** -- Connector discovery

---

## Ableton + Claude/MCP Integration

### The Ecosystem

Multiple MCP servers exist that bridge Claude to Ableton Live:

| Project | Method | Best For | GitHub |
|---------|--------|----------|--------|
| **ahujasid/ableton-mcp** | TCP Socket + Remote Script | General use (most popular, ~1.9k stars) | `github.com/ahujasid/ableton-mcp` |
| **uisato/ableton-mcp-extended** | TCP + UDP | Live performance, voice/TTS | `github.com/uisato/ableton-mcp-extended` |
| **Simon-Kansara/ableton-live-mcp-server** | OSC via AbletonOSC | OSC-based workflows | `github.com/Simon-Kansara/ableton-live-mcp-server` |
| **xiaolaa2/ableton-copilot-mcp** | ableton-js (Node) | Arrangement View, undo history | `github.com/xiaolaa2/ableton-copilot-mcp` |
| **Producer Pal** | Max for Live + MCP | Multi-model (Claude, GPT, Gemini, Ollama) | `github.com/adamjmurray/producer-pal` |

### How It Works (Architecture)

```
You: "Create a synth pad track in C minor"
       |
       v
Claude Code (or Claude Desktop)
       |
       v (MCP protocol)
Ableton MCP Server (Python/Node)
       |
       v (TCP socket / OSC / JSON commands)
Ableton Live Remote Script (runs inside Ableton)
       |
       v (Ableton Live API)
Ableton Live -> Track created, instrument loaded, MIDI notes placed
```

### Quick Install (ahujasid/ableton-mcp -- recommended)

```bash
# For Claude Code / Claude Desktop:
npx -y @smithery/cli install @ahujasid/ableton-mcp --client claude

# Or manual:
# 1. Copy Remote Script to Ableton's MIDI Remote Scripts folder
# 2. Enable it in Ableton Preferences > MIDI
# 3. Add to Claude's MCP config:
#    "AbletonMCP": {"command": "uvx", "args": ["ableton-mcp"]}
```

Requirements: Ableton Live 10+, Python 3.8+, uv package manager

### What You Can Do with Ableton MCP

- Create MIDI and audio tracks
- Load instruments and effects by name
- Create/edit MIDI clips with specific notes, velocities, durations
- Control playback, tempo, transport
- Get session info (tracks, clips, devices)
- Build arrangements through conversation

### AbletonGPT vs MCP Approach

| | AbletonGPT | MCP Approach |
|---|---|---|
| **Type** | Standalone desktop app | MCP server + Claude |
| **Cost** | Commercial | Free/Open Source (MIT) |
| **AI Model** | Proprietary | Your choice (Claude, GPT, etc.) |
| **Flexibility** | Fixed features | Fully programmable |
| **Community** | Closed | Active open-source community |

### Producer Pal (Best Open-Source Option)

- Max for Live device that runs an MCP server via Node for Max
- Supports Claude, Gemini, ChatGPT, Ollama, and local models
- Drag .amxd onto a MIDI track, configure .mcpb extension in Claude Desktop
- Free, open-source (GPL-3.0)
- GitHub: `github.com/adamjmurray/producer-pal`

### Other AI + Ableton Tools

- **Google Magenta Studio** -- Free Max for Live suite: melody generation, groove humanization, interpolation
- **RoEx** -- AI mixing platform with Ableton project export
- **Output Co-Producer** -- AI sample matching inside Ableton

---

## Resources & Links

### Official Anthropic
- Plugin docs: `code.claude.com/docs/en/plugins`
- Skills docs: `code.claude.com/docs/en/skills`
- Plugin reference: `code.claude.com/docs/en/plugins-reference`
- Marketplace guide: `code.claude.com/docs/en/plugin-marketplaces`
- Official marketplace: `github.com/anthropics/claude-plugins-official`
- Agent Skills standard: `agentskills.io`

### Key Plugins & Frameworks
- Superpowers: `github.com/obra/superpowers`
- Rube: `github.com/ComposioHQ/Rube`

### Ableton MCP
- Main: `github.com/ahujasid/ableton-mcp`
- Extended: `github.com/uisato/ableton-mcp-extended`
- Producer Pal: `github.com/adamjmurray/producer-pal` / `producer-pal.org`
- Comparison guide: `mslinn.com/av_studio/555-ableton-mcp-options.html`

### Community
- Claude Code Plugins Hub: `claudecodeplugins.io`
- DataCamp tutorial: `datacamp.com/tutorial/how-to-build-claude-code-plugins`
