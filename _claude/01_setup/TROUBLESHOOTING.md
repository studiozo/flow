# 🔧 Troubleshooting Guide: Claude Code × Git Worktrees

## Common Issues & Solutions

### 1. Authentication Issues

#### Problem: "Authentication failed" or "Permission denied"
```
fatal: could not read Username for 'https://github.com': terminal prompts disabled
```

**Solution A: Use GitHub CLI (Recommended)**
```bash
# Install if needed
brew install gh

# Authenticate
gh auth login
# Choose: GitHub.com
# Choose: HTTPS
# Authenticate: Yes
# Complete browser flow

# Verify
gh auth status
```

**Solution B: Use SSH Key**
```bash
# Generate key (if needed)
ssh-keygen -t ed25519 -C "your_email@example.com"
# Press Enter for default location
# Optional: add passphrase

# Add to agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Test
ssh -T git@github.com
# Should see: "You've successfully authenticated"
```

**Solution C: Use Personal Access Token**
```bash
# Create token at: https://github.com/settings/tokens
# Scope: repo (full control of private repositories)

# Configure git
git config --global credential.helper osxkeychain

# When prompted for password, use token instead
```

---

### 2. Git Worktree Issues

#### Problem: "fatal: invalid reference: feature-a"
```
fatal: invalid reference: feature-a
```

**Cause:** Branch doesn't exist or already checked out in another worktree

**Solution:**
```bash
# Use -b flag to CREATE new branch
git worktree add ../harmonia-worktrees/feature-a -b feature-a

# Or check out existing branch (not in another worktree)
git worktree add ../harmonia-worktrees/feature-a feature-a

# List existing branches
git branch -a
```

---

#### Problem: "fatal: 'feature-a' is already checked out at..."
```
fatal: 'feature-a' is already checked out at '/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees/feature-a'
```

**Cause:** Branch is already checked out in another worktree

**Solution:**
```bash
# You can't check out the same branch twice
# Create a NEW branch instead
git worktree add ../harmonia-worktrees/feature-a-v2 -b feature-a-v2

# Or remove the existing worktree first
git worktree remove ../harmonia-worktrees/feature-a
git worktree add ../harmonia-worktrees/feature-a -b feature-a
```

---

#### Problem: "fatal: working tree '/path/to/worktree' is locked, reason: ..."
```
fatal: working tree '/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees/feature-a' is locked, reason: ...
```

**Cause:** Worktree was not cleanly removed or is in use

**Solution:**
```bash
# Unlock the worktree
git worktree unlock ../harmonia-worktrees/feature-a

# Or force remove
git worktree remove ../harmonia-worktrees/feature-a --force

# Clean up metadata
git worktree prune --verbose
```

---

#### Problem: Worktree directory is missing but git still references it
```
git worktree list
# Shows worktree that doesn't actually exist
```

**Solution:**
```bash
# Clean up
git worktree prune --verbose

# If that doesn't work, manually clean metadata
rm -rf .git/worktrees/*
git worktree prune
```

---

### 3. Claude CLI Issues

#### Problem: "claude: command not found"
```
zsh: command not found: claude
```

**Cause:** Claude CLI not installed

**Solution:**
```bash
# Using Homebrew
brew install anthropic-cli

# Or using npm
npm install -g @anthropic-ai/claude-code

# Or using pip
pip install anthropic-cli

# Verify
claude --version
which claude
```

---

#### Problem: Claude won't launch or immediately closes
```
$ claude
(nothing happens or closes instantly)
```

**Cause:** Environment variables not set or Claude config issue

**Solution:**
```bash
# Check if Claude is properly installed
claude --version
which claude

# Check environment
echo $CLAUDE_API_KEY
echo $PATH

# Try reinstalling
brew uninstall anthropic-cli
brew install anthropic-cli

# Or reset config
rm -rf ~/.claude
claude  # This will reinitialize
```

---

#### Problem: Claude sessions not persisting between runs
```
/resume  # Shows no sessions
```

**Cause:** Session data not stored correctly

**Solution:**
```bash
# Check session storage location
ls -la ~/.claude/

# Verify permissions
chmod 755 ~/.claude/
chmod 644 ~/.claude/*

# Try renaming session explicitly
/rename my-session

# Then /resume to verify
```

---

#### Problem: "API key not found" or authentication error in Claude
```
Error: API key not found
```

**Cause:** ANTHROPIC_API_KEY environment variable not set

**Solution:**
```bash
# Set API key temporarily
export ANTHROPIC_API_KEY="sk-..."
claude

# To set permanently, add to ~/.zshrc
echo 'export ANTHROPIC_API_KEY="sk-..."' >> ~/.zshrc
source ~/.zshrc

# Or use .env file
echo 'ANTHROPIC_API_KEY=sk-...' > ~/.claude/.env
```

---

### 4. Directory & Path Issues

#### Problem: "No such file or directory" when creating worktree
```
fatal: cannot mkdir: No such file or directory
```

**Cause:** Parent directory doesn't exist

**Solution:**
```bash
# Create worktree directory first
mkdir -p /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees

# Then create worktree
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
git worktree add ../harmonia-worktrees/feature-a -b feature-a

# Or use full path
git worktree add ~/00_ZØ_CØDE/00_apps/harmonia-worktrees/feature-a -b feature-a
```

---

#### Problem: "Not a git repository"
```
fatal: not a git repository (or any of the parent directories): .git
```

**Cause:** Not in a git repository directory

**Solution:**
```bash
# Navigate to repo root
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia

# Verify you're in a git repo
git status

# If not, initialize
git init
```

---

### 5. Dependencies & Installation Issues

#### Problem: "git: command not found"
**Solution:**
```bash
# Install git
brew install git

# Verify
git --version
```

---

#### Problem: "tmux: command not found" (when trying to use parallel mode)
**Solution:**
```bash
# Install tmux (optional)
brew install tmux

# Or use manual method instead
osascript -e "tell application \"Terminal\" to do script \"cd /path && claude\""
```

---

#### Problem: "npm: command not found" (when installing Claude)
**Solution:**
```bash
# Install Node.js (includes npm)
brew install node

# Verify
npm --version
node --version
```

---

### 6. Performance Issues

#### Problem: Worktrees are slow or consuming lots of disk space
```
du -sh /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees/
# Shows 1.2G or larger
```

**Cause:** Node modules or build artifacts duplicated in each worktree

**Solution:**
```bash
# Install dependencies in each worktree separately
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees/feature-a
npm install  # This creates node_modules in this worktree

# Don't share node_modules (each worktree gets its own)
# This is actually correct behavior for isolation

# To reduce size, use npm ci instead of npm install
npm ci  # Faster, cleaner install from package-lock.json

# Consider using npm link for shared packages
npm link @package/name
```

---

#### Problem: Claude sessions sluggish with large files
**Solution:**
```bash
# Check file size
du -sh .

# Exclude large directories from git
echo "node_modules/" >> .gitignore
echo "dist/" >> .gitignore
echo ".env" >> .gitignore

# Rebuild git index
git add -A
git commit -m "Update gitignore"
```

---

### 7. Script Issues

#### Problem: "Permission denied" when running scripts
```
./setup-worktrees.sh: Permission denied
```

**Solution:**
```bash
# Make executable
chmod +x setup-worktrees.sh
chmod +x worktree-setup.sh
chmod +x activate.sh

# Verify
ls -la *.sh
# Should show -rwxr-xr-x

# Run
./setup-worktrees.sh
```

---

#### Problem: Script fails with "REPO_DIR not found"
**Cause:** Script paths hardcoded incorrectly

**Solution:**
```bash
# Update paths in script
# Edit: setup-worktrees.sh, worktree-setup.sh
# Check: REPO_DIR, WORKTREE_BASE variables

# Or specify paths interactively
./activate.sh
# Script will ask for repo path if not found
```

---

### 8. tmux Issues

#### Problem: "tmux: can't connect to /tmp/tmux-*/default"
```
error connecting to /tmp/tmux-1000/default (No such file or directory)
```

**Cause:** tmux server crashed or permission issue

**Solution:**
```bash
# Kill and restart tmux server
tmux kill-server

# Create new session
tmux new-session -d -s work

# Verify
tmux list-sessions
```

---

#### Problem: Can't see other panes in tmux
**Solution:**
```bash
# Inside tmux, navigate panes
Ctrl+B → (right)
Ctrl+B ← (left)
Ctrl+B ↑ (up)
Ctrl+B ↓ (down)

# Or select by index
Ctrl+B ; (select last pane)

# Zoom in to see better
Ctrl+B z

# Reset layout
Ctrl+B Space (cycle layouts)
```

---

#### Problem: Killing a tmux pane closes all Claude sessions
**Solution:**
```bash
# Don't use Ctrl+C to exit Claude within tmux
# Instead, exit cleanly inside Claude

# Inside Claude: press Ctrl+D or type 'exit'

# If you accidentally close a pane, just create a new one
tmux new-window -t session-name -c /path/to/worktree
tmux send-keys -t session-name "claude" C-m
```

---

### 9. Merge Conflicts

#### Problem: Merge conflicts when merging worktree back to main
```
CONFLICT (content): Merge conflict in file.js
```

**Solution:**
```bash
# 1. See conflicts
git status

# 2. Open file in Claude
claude

# 3. Inside Claude, edit files to resolve conflicts
# (Claude shows <<<<<<, ======, >>>>>> markers)

# 4. Mark as resolved
git add resolved-file.js

# 5. Complete merge
git commit -m "Merge feature-a"

# 6. Push to remote
git push origin main
```

---

#### Problem: Merge aborted, branches are out of sync
```
error: Your local changes to 'main' would be overwritten by merge.
```

**Solution:**
```bash
# Stash changes
git stash

# Then merge
git merge feature-a

# Apply changes back
git stash pop
```

---

### 10. Data Loss / Recovery

#### Problem: Accidentally deleted a worktree
```
$ cd ../harmonia-worktrees/feature-a
# Doesn't exist!
```

**Solution:**
```bash
# Worktree is deleted but branch still exists
# Recreate it
git worktree add ../harmonia-worktrees/feature-a feature-a

# Or use recovery branch
git reflog  # See all commits
git checkout -b recovered-feature abc1234  # Replace with commit ID
git worktree add ../harmonia-worktrees/feature-a recovered-feature
```

---

#### Problem: Lost work in a worktree
**Solution:**
```bash
# Check git reflog
cd ../harmonia-worktrees/feature-a
git reflog

# Recover specific commit
git checkout abc1234  # Lost commit ID

# Or reset to saved state
git reset --hard @{1}  # Go back to previous state

# Or stash recovery (if you had uncommitted changes)
git stash list
git stash pop
```

---

### 11. Network Issues

#### Problem: "Connection refused" when pushing to remote
**Cause:** Network issue or SSH misconfiguration

**Solution:**
```bash
# Test connection
ssh -T git@github.com

# Or use HTTPS instead of SSH
git remote set-url origin https://github.com/studiozo/harmonia.git

# Try push again
git push origin main
```

---

### 12. Quick Diagnostic Commands

Run these to diagnose issues:

```bash
# 1. Git status
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
git status
git worktree list

# 2. Claude info
which claude
claude --version

# 3. Authentication
gh auth status  # or
ssh -T git@github.com

# 4. Directory structure
ls -la /Users/studiozo/00_ZØ_CØDE/00_apps/
ls -la /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees/

# 5. Check environment
echo $CLAUDE_API_KEY
echo $PATH

# 6. Script permissions
ls -la /Users/studiozo/01_ZØ_AGENTS/_claude/*.sh

# 7. Disk usage
du -sh /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees/

# 8. tmux sessions (if using)
tmux list-sessions
```

---

## Getting Help

1. **Check docs first:**
   - EXECUTION_PLAN.md — Setup walkthrough
   - CHEAT_SHEET.md — Command reference
   - README_QUICKSTART.md — Quick start

2. **Search GitHub issues:**
   - git-scm.com/docs/git-worktree
   - github.com/anthropics/claude-code/issues

3. **Run diagnostic:**
   ```bash
   # Collect diagnostic info
   git --version
   claude --version
   git worktree list --verbose
   git config --list
   ```

4. **Reset and try again:**
   ```bash
   # If everything is broken, start fresh
   git worktree prune
   git worktree list
   rm -rf /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees/*
   git worktree list  # Should be empty
   ```

---

## Pro Tips to Avoid Issues

1. ✅ **Always use `-b` flag** when creating worktrees
2. ✅ **Clean up completed worktrees** immediately after merging
3. ✅ **Commit regularly** to avoid large diffs
4. ✅ **Name sessions descriptively** with `/rename`
5. ✅ **Check git status** before complex operations
6. ✅ **Use `git worktree list`** before creating new ones
7. ✅ **Test authentication** before starting work
8. ✅ **Keep dependencies separate** (npm install in each worktree)
9. ✅ **Pull before creating** worktree from main
10. ✅ **Merge frequently** to avoid conflicts
