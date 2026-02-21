# Git Worktrees + Claude Code Setup Guide

## Part 1: GitHub Authentication for Private Repos

### Option A: Using GitHub CLI (Recommended)

1. **Install GitHub CLI** (if not installed):
   ```bash
   brew install gh
   ```

2. **Authenticate**:
   ```bash
   gh auth login
   ```
   - Choose: GitHub.com
   - Choose: HTTPS
   - Authenticate: Yes
   - Follow the browser flow

3. **Verify authentication**:
   ```bash
   gh auth status
   ```

### Option B: Using SSH Keys

1. **Generate SSH key** (if you don't have one):
   ```bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   # Press Enter to accept default location
   # Optional: add a passphrase
   ```

2. **Add SSH key to ssh-agent**:
   ```bash
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
   ```

3. **Copy public key**:
   ```bash
   cat ~/.ssh/id_ed25519.pub | pbcopy
   ```

4. **Add to GitHub**:
   - Go to: https://github.com/settings/keys
   - Click "New SSH key"
   - Paste your key
   - Click "Add SSH key"

5. **Test connection**:
   ```bash
   ssh -T git@github.com
   ```

### Option C: Using Personal Access Token (PAT)

1. **Create PAT**:
   - Go to: https://github.com/settings/tokens
   - Click "Generate new token (classic)"
   - Scopes needed: `repo` (full control of private repositories)
   - Click "Generate token"
   - **Copy the token immediately** (you won't see it again)

2. **Configure git to use token**:
   ```bash
   git config --global credential.helper osxkeychain
   ```

3. **When cloning/pushing**, use HTTPS and enter:
   - Username: your GitHub username
   - Password: paste your PAT (not your GitHub password)

---

## Part 2: Setting Up Git Worktrees

### What Are Worktrees?

Git worktrees let you check out multiple branches simultaneously in separate directories, all sharing the same Git history. Perfect for running parallel Claude Code sessions.

### Basic Worktree Commands

**Create a new worktree with new branch**:
```bash
git worktree add ../harmonia-feature-a -b feature-a
```

**Create worktree from existing branch**:
```bash
git worktree add ../harmonia-bugfix bugfix-123
```

**List all worktrees**:
```bash
git worktree list
```

**Remove a worktree**:
```bash
git worktree remove ../harmonia-feature-a
# or
cd ../harmonia-feature-a && cd .. && rm -rf harmonia-feature-a
git worktree prune
```

### Recommended Directory Structure

```
/Users/studiozo/00_ZØ_CØDE/00_apps/
├── harmonia/                    # Main repo (main/master branch)
├── harmonia-worktrees/          # Worktrees folder
│   ├── feature-a/              # Worktree for feature-a branch
│   ├── feature-b/              # Worktree for feature-b branch
│   └── bugfix-123/             # Worktree for bugfix-123 branch
```

### Setup Script

Create this directory structure:

```bash
# From your main repo
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia

# Create worktrees directory
mkdir -p ../harmonia-worktrees

# Create worktrees
git worktree add ../harmonia-worktrees/feature-a -b feature-a
git worktree add ../harmonia-worktrees/feature-b -b feature-b
```

---

## Part 3: Running Parallel Claude Code Sessions

### Method 1: Manual (Simple)

Open separate terminal tabs/windows:

**Terminal Tab 1**:
```bash
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
claude
# Inside Claude: /rename main-development
```

**Terminal Tab 2**:
```bash
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees/feature-a
claude
# Inside Claude: /rename feature-a-work
```

**Terminal Tab 3**:
```bash
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees/feature-b
claude
# Inside Claude: /rename feature-b-work
```

### Method 2: Using tmux (Advanced)

**Create tmux session with multiple panes**:

```bash
#!/bin/bash
# Save as: launch-parallel-claude.sh

tmux new-session -d -s harmonia-dev

# Main pane
tmux send-keys -t harmonia-dev "cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia && claude" C-m

# Split and create second pane
tmux split-window -t harmonia-dev -h
tmux send-keys -t harmonia-dev "cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees/feature-a && claude" C-m

# Split and create third pane
tmux split-window -t harmonia-dev -v
tmux send-keys -t harmonia-dev "cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees/feature-b && claude" C-m

# Attach to session
tmux attach -t harmonia-dev
```

Make it executable:
```bash
chmod +x launch-parallel-claude.sh
./launch-parallel-claude.sh
```

---

## Part 4: Best Practices

### 1. Install Dependencies Per Worktree

Each worktree needs its own dependencies:

```bash
# In each worktree
npm install        # Node.js
pip install -r requirements.txt  # Python
bundle install     # Ruby
```

### 2. Name Your Claude Sessions

Use `/rename <descriptive-name>` inside each Claude Code session:
- Makes it easy to identify sessions
- Helpful when using `/resume` to switch between sessions

### 3. Share Configuration with CLAUDE.md

Your `.claude/CLAUDE.md` file is automatically available in all worktrees since it's in the repo. Run `/init` in each Claude session to orient Claude with the specific context.

### 4. Keep Worktrees Organized

- **Limit to 3-4 active worktrees** max
- Use **descriptive directory names** (feature-auth, bugfix-login, etc.)
- **Clean up completed worktrees** regularly

### 5. Merging Work Back

Since all worktrees share the same Git history:

```bash
# Switch to main branch (in main repo)
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
git checkout main

# Merge feature branch
git merge feature-a

# Push to remote
git push origin main

# Clean up worktree
git worktree remove ../harmonia-worktrees/feature-a
git branch -d feature-a  # delete local branch if done
```

---

## Part 5: Quick Reference Cheat Sheet

```bash
# CREATE WORKTREE
git worktree add <path> -b <branch-name>

# LIST WORKTREES
git worktree list

# REMOVE WORKTREE
git worktree remove <path>

# CLEANUP STALE WORKTREES
git worktree prune

# LAUNCH CLAUDE IN WORKTREE
cd <worktree-path> && claude

# RENAME CLAUDE SESSION
/rename <session-name>

# RESUME CLAUDE SESSION
/resume
# (shows all sessions across all worktrees)

# MERGE WORK BACK
cd <main-repo>
git checkout main
git merge <branch-name>
```

---

## Troubleshooting

### "Branch already checked out"
You can't check out the same branch in multiple worktrees. Create a new branch:
```bash
git worktree add ../harmonia-worktrees/new-feature -b new-feature
```

### Node modules / dependencies missing
Install dependencies separately in each worktree:
```bash
cd <worktree-path>
npm install  # or pip install, bundle install, etc.
```

### Can't find my Claude session
Use `/resume` - it shows all sessions from all worktrees in the same repo.

### Worktree directory conflicts
Use the recommended structure with a dedicated worktrees folder to avoid conflicts.

---

## Community Tools

- **crystal** (github.com/stravu/crystal) — run multiple Claude Code sessions in parallel worktrees
- **parallel-cc** (github.com/frankbria/parallel-cc) — coordinate parallel sessions with cloud sandboxes
- **worktree-workflow** (github.com/forrestchang/worktree-workflow) — automate worktree creation

---

## Next Steps

1. ✅ Set up GitHub authentication (choose Option A, B, or C above)
2. ✅ Create your first worktree
3. ✅ Launch Claude Code in multiple worktrees
4. ✅ Use `/rename` to identify each session
5. ✅ Start working in parallel!

**Questions?** Run `/help` inside Claude Code or visit: https://docs.claude.ai/claude-code
