# 🎯 Claude Code × Git Worktrees — Command Cheat Sheet

## 📋 Table of Contents
1. [Git Worktree Commands](#git-worktree-commands)
2. [Claude CLI Commands](#claude-cli-commands)
3. [Workflow Commands](#workflow-commands)
4. [tmux Commands](#tmux-commands)
5. [Useful Aliases](#useful-aliases)

---

## ⚡ Path Conventions

All commands use generic paths that work with ANY project:
- `/path/to/your/repo` — Your main git repository
- `../worktrees/` — Worktrees folder (sibling to your repo)
- `/path/to/scripts/` — Location of your setup scripts

**Replace these with your actual paths** when running commands!

---

## Git Worktree Commands

### Create
```bash
# Create worktree with NEW branch
git worktree add ../worktrees/feature-x -b feature-x

# Create worktree from EXISTING branch
git worktree add ../worktrees/feature-y feature-y

# Create worktree from existing remote branch
git worktree add ../worktrees/feature-z origin/feature-z
```

### List & Inspect
```bash
# List all worktrees
git worktree list

# List with paths
git worktree list -p

# List in porcelain format (machine-readable)
git worktree list --porcelain

# Show which branches are checked out
git branch -l
```

### Remove & Cleanup
```bash
# Remove a worktree
git worktree remove ../worktrees/feature-x

# Force remove (if locked)
git worktree remove ../worktrees/feature-x --force

# Cleanup stale worktrees
git worktree prune

# Delete associated branch
git branch -d feature-x

# Force delete branch
git branch -D feature-x
```

### Repair
```bash
# Fix "worktree is locked" error
git worktree unlock ../worktrees/feature-x

# Repair repository metadata
git worktree prune --verbose
```

---

## Claude CLI Commands

### Session Management
```bash
# Start Claude in current directory
claude

# Rename current session
/rename my-feature-work

# List all active sessions (shows all across worktrees)
/resume

# Switch to a specific session
/resume
# (then select from list)

# Clear session context
/reset

# Show current session info
/info
```

### Configuration
```bash
# Initialize context (loads CLAUDE.md if exists)
/init

# View Claude version
claude --version

# Show help
claude --help
```

### File Operations
```bash
# Create a new file
/create filename.js

# Read a file
/read filename.js

# Edit a file
/edit filename.js

# Delete a file
/delete filename.js

# Search in files
/grep "search term"
```

### Code Execution
```bash
# Run shell command
!command here

# Execute JavaScript
/exec js
// code here
/end

# Execute Python
/exec python
# code here
/end
```

---

## Workflow Commands

### Quick Start (from main repo)
```bash
# Navigate to repo
cd /path/to/your/repo

# Create new feature worktree
git worktree add ../worktrees/my-feature -b my-feature

# Navigate to worktree
cd ../worktrees/my-feature

# Launch Claude
claude
```

### Inside Claude Session
```bash
# 1. Name the session
/rename my-feature-work

# 2. Load project context
/init

# 3. Start working
(edit files, run /exec commands, etc.)

# 4. When switching sessions
/resume

# 5. Switch back
/resume
```

### Parallel Development
```bash
# Terminal 1 - Main branch
cd /path/to/your/repo
claude
# Inside: /rename main-work

# Terminal 2 - Feature A
cd /path/to/your/worktrees/feature-a
claude
# Inside: /rename feature-a-work

# Terminal 3 - Feature B
cd /path/to/your/worktrees/feature-b
claude
# Inside: /rename feature-b-work

# Switch between sessions in any Claude instance
/resume
```

### Merging & Publishing
```bash
# In the worktree, commit work
git add .
git commit -m "Implement feature-x"

# Push feature branch
git push origin my-feature

# Switch to main repo
cd ../repo

# Checkout main
git checkout main

# Pull latest
git pull origin main

# Merge feature branch
git merge my-feature

# Push to remote
git push origin main

# Delete feature branch
git branch -d my-feature

# Clean up worktree
git worktree remove ../worktrees/my-feature
```

### Quick Feature Loop
```bash
#!/bin/bash
FEATURE_NAME="$1"
REPO="/path/to/your/repo"
WTHOME="$REPO/../worktrees"

# Create worktree
git worktree add "$WTHOME/$FEATURE_NAME" -b "$FEATURE_NAME"

# Launch Claude
cd "$WTHOME/$FEATURE_NAME" && claude
```

---

## tmux Commands

### Session Management
```bash
# Create new session
tmux new-session -d -s claude-dev

# List sessions
tmux list-sessions

# Attach to session
tmux attach -t claude-dev

# Detach from session
# (inside tmux) Ctrl+B D

# Kill session
tmux kill-session -t claude-dev

# Kill all sessions
tmux kill-server
```

### Window Management
```bash
# Create new window
tmux new-window -t claude-dev -n "feature-a"

# List windows
tmux list-windows -t claude-dev

# Select window by number
# (inside tmux) Ctrl+B 0, Ctrl+B 1, etc.

# Rename window
# (inside tmux) Ctrl+B ,

# Close window
# (inside tmux) Ctrl+B &
```

### Pane Management
```bash
# Split pane horizontally
tmux split-window -t claude-dev -h

# Split pane vertically
tmux split-window -t claude-dev -v

# Navigate panes
# (inside tmux) Ctrl+B → ← ↑ ↓

# Zoom into pane
# (inside tmux) Ctrl+B Z

# Resize pane
# (inside tmux) Ctrl+B + arrow keys (hold)

# Close pane
# (inside tmux) Ctrl+B X
```

### Layout Management
```bash
# Tile layout
tmux select-layout -t claude-dev tiled

# Even horizontal
tmux select-layout -t claude-dev even-horizontal

# Even vertical
tmux select-layout -t claude-dev even-vertical

# Cycle layouts
# (inside tmux) Ctrl+B Space
```

### Automation
```bash
# Launch multi-worktree session
tmux new-session -d -s work -c /path/to/your/repo
tmux send-keys -t work "claude" C-m

tmux split-window -t work -h -c /path/to/your/worktrees/feature-a
tmux send-keys -t work "claude" C-m

tmux split-window -t work -h -c /path/to/your/worktrees/feature-b
tmux send-keys -t work "claude" C-m

tmux attach -t work
```

---

## Useful Aliases

### Add to ~/.zshrc

```bash
# Git Worktree Shortcuts
alias wt-new='git worktree add ../worktrees'
alias wt-list='git worktree list'
alias wt-rm='git worktree remove'
alias wt-prune='git worktree prune && git worktree prune --verbose'

# Claude Development
alias claude-dev='cd /path/to/repo && claude'
alias claude-new-wt='cd /path/to/repo && /path/to/scripts/worktree-setup.sh new'
alias claude-list-wt='cd /path/to/repo && git worktree list'
alias claude-launch-all='/path/to/scripts/worktree-setup.sh parallel'

# tmux
alias tmx-attach='tmux attach -t'
alias tmx-new='tmux new-session -d -s'
alias tmx-list='tmux list-sessions'
alias tmx-kill='tmux kill-session -t'

# Navigation
alias repo='cd /path/to/repo'
alias wthome='cd /path/to/worktrees'
alias scripts='cd /path/to/scripts'

# Helper functions
wt-info() {
    echo "Current worktrees:"
    cd /path/to/repo
    git worktree list
}

wt-cd() {
    local wt="$1"
    cd "/path/to/worktrees/$wt"
}

claude-wt() {
    local wt="$1"
    cd "/path/to/worktrees/$wt"
    claude
}

# Example: claude-wt feature-a
```

### Apply Aliases
```bash
# Add to ~/.zshrc, then:
source ~/.zshrc

# Test
wt-info
claude-dev
```

---

## One-Liners

```bash
# Create worktree and launch Claude immediately
git worktree add ../worktrees/new-feature -b new-feature && cd ../worktrees/new-feature && claude

# List all worktrees with detailed info
git worktree list -p | while read path; do echo "$path"; done

# Remove all completed worktrees at once
git worktree list --porcelain | grep "^worktree " | sed 's/^worktree //' | grep -v "$(pwd)" | xargs -I {} git worktree remove {}

# Launch all worktrees in tmux automatically
git worktree list --porcelain | grep "^worktree " | sed 's/^worktree //' | xargs -I {} tmux new-window -t work "cd {} && claude"

# Count active worktrees
git worktree list --porcelain | grep "^worktree " | wc -l

# Clean up all locked worktrees
git worktree list --porcelain | grep "^worktree " | sed 's/^worktree //' | xargs -I {} git worktree unlock {} 2>/dev/null; git worktree prune
```

---

## Quick Reference Table

| Task | Command |
|------|---------|
| Create worktree | `git worktree add <path> -b <branch>` |
| List worktrees | `git worktree list` |
| Remove worktree | `git worktree remove <path>` |
| Launch Claude | `claude` |
| Rename session | `/rename <name>` |
| Switch session | `/resume` |
| Create tmux | `tmux new-session -d -s <name>` |
| Launch parallel | `./worktree-setup.sh parallel` |
| Merge to main | `git merge <branch>` |
| Cleanup | `git worktree prune` |

---

## Pro Tips

1. **Always use `-b` flag** when creating worktrees to create a new branch
2. **Name sessions descriptively** with `/rename` to avoid confusion
3. **Use `/resume`** to navigate between sessions instead of restarting Claude
4. **Keep 2-3 active worktrees** max for performance
5. **Merge frequently** to avoid large merge conflicts
6. **Use tmux** for better organization when managing 3+ parallel sessions
7. **Check `git worktree list`** before creating to avoid branch conflicts
8. **Clean up immediately** after merging to keep filesystem clean

---

## See Also
- EXECUTION_PLAN.md — Full setup walkthrough
- WORKTREE_SETUP_GUIDE.md — Detailed documentation
- README_QUICKSTART.md — Quick reference
- TROUBLESHOOTING.md — Common issues & fixes
