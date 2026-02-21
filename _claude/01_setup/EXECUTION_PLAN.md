# 🚀 Claude Code × Git Worktrees — Execution Plan

**This is a UNIVERSAL SYSTEM that works with ANY Git project.**
Examples: harmonia, savaya, touchdesigner, or your own projects!

## Current Status
✅ Documentation written  
✅ Setup scripts created  
✅ Configuration templates ready  

**Now let's activate it for your project!**

---

## Phase 1: Prerequisites Check (5 minutes)

### 1.1 Verify GitHub Authentication
Choose **ONE** and complete:

**Option A: GitHub CLI** (Recommended)
```bash
# Check if installed
which gh

# If not installed
brew install gh

# Authenticate
gh auth login
# → Choose: GitHub.com
# → Choose: HTTPS  
# → Authenticate: Yes
# → Complete browser flow

# Verify
gh auth status
```

**Option B: SSH Key** (Most Secure)
```bash
# Generate key (if needed)
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add to agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Test connection
ssh -T git@github.com
# Should see: "successfully authenticated"
```

**Option C: Personal Access Token**
- Go to: https://github.com/settings/tokens
- Generate new token (classic)
- Scope: `repo` (full control)
- Copy token immediately
- Configure git: `git config --global credential.helper osxkeychain`

### 1.2 Install Required Tools
```bash
# Check if git is installed
git --version

# Check if Claude CLI is installed
claude --version

# Install tmux (optional but recommended for parallel)
brew install tmux
```

---

## Phase 2: Initial Setup (10 minutes)

### 2.1 Navigate to Your Repo
```bash
# Choose ANY project you want to use with Claude
cd /path/to/your/project

# Examples:
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
# or
cd /Users/studiozo/00_ZØ_CØDE/00_apps/savaya
# or
cd /Users/studiozo/00_ZØ_CØDE/00_apps/touchdesigner-edits
```

### 2.2 Initialize Worktrees Directory
```bash
# Create a worktrees folder for your project
# (sibling to your project directory)
mkdir -p ../project-worktrees

# Or if using harmonia:
mkdir -p ../harmonia-worktrees

# Or if using savaya:
mkdir -p ../savaya-worktrees
```

### 2.3 Make Setup Scripts Executable
```bash
cd /Users/studiozo/01_ZØ_AGENTS/_claude

chmod +x setup-worktrees.sh
chmod +x worktree-setup.sh

# Verify
ls -la *.sh
```

---

## Phase 3: Create Your First Worktree (10 minutes)

### 3.1 Using the Interactive Script
```bash
# Run from your project directory
/Users/studiozo/01_ZØ_AGENTS/_claude/worktree-setup.sh

# → Choose: 1 (Create new worktree)
# → Enter name: feature-a
# → Launch Claude? Yes
```

**OR** manually:
```bash
# From your project directory
cd /path/to/your/project

# Create worktree with new branch
git worktree add ../project-worktrees/feature-a -b feature-a

# Launch Claude in it
cd ../project-worktrees/feature-a
claude
```

### 3.2 Inside Claude (First Time)
Once Claude opens:
```
/rename feature-a-dev
/init
```

---

## Phase 4: Create Parallel Worktrees (10 minutes)

### 4.1 Create Second Worktree
```bash
# In your project directory
cd /path/to/your/project

# Create second worktree
git worktree add ../project-worktrees/feature-b -b feature-b
```

### 4.2 Create Third Worktree (Optional)
```bash
git worktree add ../harmonia-worktrees/bugfix-xyz -b bugfix-xyz
```

### 4.3 List All Worktrees
```bash
git worktree list
```

Expected output:
```
/path/to/your/project (bare)
/path/to/your/project-worktrees/feature-a  <worktree-hash>
/path/to/your/project-worktrees/feature-b  <worktree-hash>
/path/to/your/project-worktrees/bugfix-xyz  <worktree-hash>
```

---

## Phase 5: Launch Parallel Claude Sessions (5 minutes)

### Option A: Manual (Simplest)
Open 3 separate terminal tabs/windows:

**Tab 1 - Main**
```bash
cd /path/to/your/project
claude
# Inside: /rename main-dev
```

**Tab 2 - Feature A**
```bash
cd /path/to/your/project-worktrees/feature-a
claude
# Inside: /rename feature-a-dev
```

**Tab 3 - Feature B**
```bash
cd /path/to/your/project-worktrees/feature-b
claude
# Inside: /rename feature-b-dev
```

### Option B: Using tmux (Advanced)
```bash
/Users/studiozo/01_ZØ_AGENTS/_claude/worktree-setup.sh parallel
```

Or manually:
```bash
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia

tmux new-session -d -s harmonia-dev
tmux send-keys -t harmonia-dev "cd . && claude" C-m

tmux split-window -t harmonia-dev -h
tmux send-keys -t harmonia-dev "cd ../harmonia-worktrees/feature-a && claude" C-m

tmux split-window -t harmonia-dev -h
tmux send-keys -t harmonia-dev "cd ../harmonia-worktrees/feature-b && claude" C-m

tmux attach -t harmonia-dev
```

**tmux Navigation:**
- `Ctrl+B` then `→` or `←` to switch panes
- `Ctrl+B` then `0`, `1`, `2` to switch windows
- `Ctrl+B` then `D` to detach
- Reattach: `tmux attach -t harmonia-dev`

### Option C: Using Script
```bash
/Users/studiozo/01_ZØ_AGENTS/_claude/worktree-setup.sh launch feature-a
```

---

## Phase 6: Daily Workflow (Ongoing)

### Create a New Feature
```bash
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
/Users/studiozo/01_ZØ_AGENTS/_claude/worktree-setup.sh new feature-payments
```

### Work Across Multiple Sessions
Inside any Claude session:
```
# List all sessions across all worktrees
/resume
# → Shows all sessions and lets you switch
```

### Merge Work Back When Done
```bash
# In main repo
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
git checkout main
git merge feature-a
git push origin main

# Clean up worktree
git worktree remove ../harmonia-worktrees/feature-a
git branch -d feature-a
```

---

## Phase 7: Advanced Setups (Optional)

### 7.1 Create Persistent Claude Config
Create `~/.claude/config.json`:
```json
{
  "worktrees": {
    "default": {
      "directory": "/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia",
      "worktree_base": "/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees"
    }
  }
}
```

### 7.2 Create Shell Aliases
Add to `~/.zshrc`:
```bash
alias claude-new='cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia && /Users/studiozo/01_ZØ_AGENTS/_claude/worktree-setup.sh new'
alias claude-list='cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia && git worktree list'
alias claude-launch='cd /Users/studiozo/00_ZØ_AGENTS/_claude && ./worktree-setup.sh parallel'
```

Then reload:
```bash
source ~/.zshrc
```

### 7.3 Install Optional Tools
```bash
# crystal - automated parallel worktree launcher
brew tap stravu/tools
brew install crystal

# htop - monitor resources
brew install htop
```

---

## ⏱️ Total Time: ~45 minutes

| Phase | Duration | Status |
|-------|----------|--------|
| Prerequisites | 5 min | ⏳ To Do |
| Initial Setup | 10 min | ⏳ To Do |
| First Worktree | 10 min | ⏳ To Do |
| Parallel Worktrees | 10 min | ⏳ To Do |
| Launch Sessions | 5 min | ⏳ To Do |
| **Total** | **45 min** | ⏳ To Do |

---

## 🎯 Success Criteria

When complete, you should be able to:

- [ ] Check `git worktree list` and see 2+ worktrees
- [ ] Open Claude in main directory with `/rename main-dev`
- [ ] Open Claude in feature-a with `/rename feature-a-dev`
- [ ] Open Claude in feature-b with `/rename feature-b-dev`
- [ ] Use `/resume` to see all 3 sessions
- [ ] Switch between sessions seamlessly
- [ ] Work on independent features in parallel
- [ ] Merge work back to main when done
- [ ] Clean up completed worktrees

---

## 🆘 Quick Troubleshooting

| Problem | Solution |
|---------|----------|
| "Branch already checked out" | Create a NEW branch with worktree: `git worktree add <path> -b <branch>` |
| "No such file" for Claude | Install: `brew install anthropic-cli` or `npm install -g @anthropic-ai/claude-code` |
| "Permission denied" for scripts | Make executable: `chmod +x setup-worktrees.sh worktree-setup.sh` |
| "Authentication failed" | Run `gh auth login` or set up SSH key |
| tmux not found | Install: `brew install tmux` or use manual method |
| Claude won't launch | Verify Claude is installed and in PATH: `which claude` |

---

## 📖 Full Documentation

See these files for detailed info:
- **README_QUICKSTART.md** — Quick reference (start here!)
- **WORKTREE_SETUP_GUIDE.md** — Detailed setup guide
- **ACTIVATION_SCRIPT.sh** — One-command activation (coming next)

---

## Next Step

👉 **Choose Phase 1 Option (A, B, or C) and start!**

Then follow the execution plan sequentially. Once Phase 5 is complete, you'll be running parallel Claude Code instances! 🎉
