# Claude Code — Docker Autopilot Setup

> Run Claude Code unattended on big projects without approving every single bash command. **Safely.**

Official DevContainer method · Claude Max subscription · February 2026

---

## Prerequisites

**Software:**
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running
- VS Code or Cursor
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installed in your editor
- Git (comes with macOS Xcode tools)

**Account:**
- Claude Max subscription — you'll log in with OAuth inside the container

> **💡 Tip:** Your Claude Max subscription works with Claude Code CLI. You do NOT need a separate API key.

---

## TL;DR — The 5 Minute Version

```
1. Install Docker Desktop + Dev Containers extension
2. git clone https://github.com/anthropics/claude-code.git
3. Open folder in VS Code/Cursor
4. Click "Reopen in Container"
5. Run: claude --dangerously-skip-permissions
6. Log in with your Claude Max account
7. Hand it your project. Go grab coffee.
```

---

## Step-by-Step Setup

### Step 1: Install Docker Desktop

If you already have Docker running, skip to Step 2.

1. Download Docker Desktop from [docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop/)
2. Run the installer and follow the prompts
3. Open Docker Desktop and wait for the whale icon to appear in your menu bar
4. Verify it works:

```bash
docker --version
# Should output: Docker version 27.x.x
```

### Step 2: Install the Dev Containers Extension

1. Open VS Code or Cursor
2. Go to Extensions (`Cmd+Shift+X`)
3. Search for **Dev Containers**
4. Install the one by Microsoft (ID: `ms-vscode-remote.remote-containers`)

> **💡 Tip:** Cursor's Extensions marketplace is the same as VS Code. Dev Containers works identically in both.

### Step 3: Clone the Official DevContainer

```bash
# Clone the official Claude Code repository
git clone https://github.com/anthropics/claude-code.git

# Navigate into the repo
cd claude-code
```

This repo contains the `.devcontainer` folder with three critical files:

| File | Purpose |
|------|---------|
| `devcontainer.json` | Container settings, extensions, volume mounts |
| `Dockerfile` | Container image (Node 20, dev tools, Claude Code CLI) |
| `init-firewall.sh` | Network security rules (whitelists only npm, GitHub, Claude API) |

### Step 4: Open the Project in the Container

1. Open the `claude-code` folder in VS Code or Cursor
2. Your editor will detect the `.devcontainer` folder and prompt:

   > *"Folder contains a Dev Container config. Reopen in Container?"*

3. Click **"Reopen in Container"**

Or manually: open Command Palette (`Cmd+Shift+P`) → type `Remote-Containers: Reopen in Container`

> **⚠️ Warning:** First build takes 3–5 minutes. Docker downloads the Node 20 image, installs tools, configures the firewall, and installs Claude Code CLI. Subsequent opens are much faster (cached).

### Step 5: Authenticate with Claude Max

Once the container is running, open the integrated terminal inside VS Code/Cursor.

1. Run:
   ```bash
   claude
   ```
2. Claude Code will prompt you to log in
3. Select **Login with browser** (OAuth)
4. A URL will appear — open it in your browser
5. Log in with your Anthropic account (the one with Max)
6. Authorize the connection
7. You should see: **Claude Code is ready** ✅

> **💡 Tip:** Your auth token persists between container restarts because the devcontainer mounts a volume for `/home/node/.claude`. You only need to log in once.

### Step 6: Run in Autopilot Mode

You're inside an isolated container with firewall rules. Now you can safely use the autopilot flag.

**Option A — Interactive YOLO Mode:**
```bash
claude --dangerously-skip-permissions
```
Type your task and let it run. No permission prompts will appear.

**Option B — Headless (fire and forget):**
```bash
claude -p "Refactor all Python files to use type hints" \
  --dangerously-skip-permissions
```

**Option C — Headless with JSON output (for scripting):**
```bash
claude -p "Run all tests and fix failures" \
  --dangerously-skip-permissions \
  --output-format json
```

**Option D — Loop through multiple tasks:**
```bash
for file in src/*.py; do
  claude -p "Add docstrings to $file" \
    --dangerously-skip-permissions
done
```

---

## Using Your Own Project

You probably don't want to work inside the `claude-code` repo itself. Two ways to use the devcontainer with your own project:

### Method 1: Copy the .devcontainer folder

```bash
cp -r claude-code/.devcontainer /path/to/your/project/
```

Then open your project in VS Code/Cursor and click "Reopen in Container" when prompted.

### Method 2: Use the devcontainer CLI

```bash
npm install -g @devcontainers/cli
devcontainer up --workspace-folder /path/to/your/project
```

> **💡 Tip:** Your project files are mounted at `/workspace` inside the container. Changes inside the container are reflected on your real filesystem. Git commits made inside the container appear in your normal git history.

---

## Why This Is Safe Inside the Container

The devcontainer provides three layers of protection:

### 1. Filesystem Isolation

Claude can only access `/workspace` (your mounted project). Your home directory, system files, SSH keys, and other projects are not visible inside the container.

### 2. Network Firewall

The `init-firewall.sh` script creates a **default-deny** firewall. Only these domains are allowed:

- `registry.npmjs.org` — installing npm packages
- GitHub — git operations, API
- `api.anthropic.com` — Claude API calls
- `sentry.io` / `statsig.anthropic.com` — telemetry
- VS Code marketplace — extensions

Everything else is blocked. If Claude gets tricked by a prompt injection into running `curl` to exfiltrate your code, the firewall blocks it.

### 3. Non-Root Execution

Claude runs as user `node` (UID 1001), not root. It cannot modify system files, install system packages, or change firewall rules.

> **⚠️ Warning:** The devcontainer does NOT protect against exfiltration to the whitelisted domains. If you're working with a malicious repository that contains prompt injections, those could theoretically send data to GitHub or npm. Only use with trusted code.

---

## Alternative: Skip Docker, Use Fine-Grained Permissions

If Docker feels like overkill, you can get 90% of the autopilot experience by pre-approving specific commands. No container needed.

Create `.claude/settings.json` in your project:

```json
{
  "permissions": {
    "allow": [
      "Bash(npm run *)",
      "Bash(npx *)",
      "Bash(git status *)",
      "Bash(git add *)",
      "Bash(git commit *)",
      "Bash(git diff *)",
      "Bash(python *)",
      "Bash(pip install *)",
      "Bash(mkdir *)",
      "Bash(ls *)",
      "Read(**)",
      "Edit(**)"
    ],
    "deny": [
      "Bash(rm -rf *)",
      "Bash(curl *)",
      "Bash(wget *)",
      "Bash(sudo *)",
      "Read(.env*)",
      "Read(secrets/**)"
    ]
  }
}
```

Then run Claude Code normally. It auto-approves commands matching your allow list, auto-denies the deny list, and only prompts for everything else.

> **⚠️ Note:** There is a known bug where `--allowedTools` may be ignored in bypass mode. Use `--disallowedTools` instead to block specific tools, which works reliably.

---

## Quick Reference

### Permission Modes

| Mode | What It Does | When to Use |
|------|-------------|-------------|
| `default` | Prompts on first use of each tool | Normal interactive work |
| `acceptEdits` | Auto-approves file edits, prompts for bash | Editing-heavy workflows |
| `plan` | Read-only; no edits or bash | Safe analysis mode |
| `dontAsk` | Auto-denies unless pre-approved | Strict control |
| `bypassPermissions` | Skips ALL prompts (YOLO) | **Only in containers/VMs** |

### Essential Commands

```bash
# Interactive autopilot (inside container)
claude --dangerously-skip-permissions

# Headless single task
claude -p "your task" --dangerously-skip-permissions

# Headless with JSON output
claude -p "your task" --dangerously-skip-permissions --output-format json

# Resume last session
claude --continue --dangerously-skip-permissions

# Resume specific session
claude --resume SESSION_ID --dangerously-skip-permissions
```

### Useful Flags

| Flag | Purpose |
|------|---------|
| `-p "prompt"` | Run non-interactively |
| `--output-format json` | Machine-parseable output |
| `--continue` | Resume last session |
| `--resume <id>` | Resume specific session |
| `--allowedTools` | Pre-approve tools (may have bugs) |
| `--disallowedTools` | Block specific tools (reliable) |
| `--max-turns N` | Limit agentic turns |

---

## Sources

- [Official DevContainer Docs](https://code.claude.com/docs/en/devcontainer)
- [Claude Code Repo (.devcontainer)](https://github.com/anthropics/claude-code/tree/main/.devcontainer)
- [Docker Sandbox for Claude Code](https://docs.docker.com/ai/sandboxes/claude-code/)
- [Safe Usage Guide](https://www.ksred.com/claude-code-dangerously-skip-permissions-when-to-use-it-and-when-you-absolutely-shouldnt/)
- [DevContainer Tutorial](https://codewithandrea.com/articles/run-ai-agents-inside-devcontainer/)
