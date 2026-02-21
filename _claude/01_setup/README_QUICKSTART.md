# Quick Start: Parallel Claude Code Sessions

**Works with ANY Git project** — harmonia, savaya, touchdesigner, or your own!

## 🚀 Get Started in 3 Steps

### Step 1: Set up GitHub Authentication

Choose **one** method:

**Option A: GitHub CLI** (Easiest)
```bash
brew install gh
gh auth login
```

**Option B: SSH Key** (Most Secure)
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id_ed25519.pub | pbcopy
# Add to: https://github.com/settings/keys
```

**Option C: Personal Access Token**
- Create at: https://github.com/settings/tokens
- Use when pushing/pulling instead of password

---

### Step 2: Navigate to Your Project

```bash
cd /path/to/your/project

# Examples:
# cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
# cd /Users/studiozo/00_ZØ_CØDE/00_apps/savaya
# cd /Users/studiozo/00_ZØ_CØDE/00_apps/touchdesigner-edits
```

---

### Step 3: Create Worktrees & Launch Claude

**Manual method** (simple):

```bash
# Create worktrees directory
mkdir -p ../project-worktrees

# Create worktrees
git worktree add ../project-worktrees/feature-a -b feature-a
git worktree add ../project-worktrees/feature-b -b feature-b

# Launch Claude in each (separate terminals)
cd ../project-worktrees/feature-a && claude
cd ../project-worktrees/feature-b && claude
```

**Script method** (guided):
```bash
/Users/studiozo/01_ZØ_AGENTS/_claude/activate.sh
# Follow interactive prompts
```

---

## 📚 Full Documentation

See `/Users/studiozo/01_ZØ_AGENTS/_claude/`:
- **CHEAT_SHEET.md** — All commands with generic paths
- **EXECUTION_PLAN.md** — Full step-by-step setup
- **TROUBLESHOOTING.md** — Problem solving
- **WORKTREE_SETUP_GUIDE.md** — Deep technical details

---

## 💡 Quick Tips

1. **Works with any project**: Same system for harmonia, savaya, touchdesigner, etc.
2. **Name your sessions**: Inside Claude, use `/rename feature-name-work`
3. **Switch sessions**: Use `/resume` to see all active sessions
4. **Keep it simple**: Start with 2-3 worktrees max
5. **Clean up when done**: `git worktree remove ../project-worktrees/feature-a`

---

## 🎯 Common Workflow

```bash
# 1. Create feature worktree
cd /path/to/your/project
git worktree add ../project-worktrees/new-feature -b new-feature

# 2. Work in it (new terminal)
cd ../project-worktrees/new-feature
claude

# 3. When done, merge back
cd /path/to/your/project
git checkout main
git merge new-feature
git push

# 4. Clean up
git worktree remove ../project-worktrees/new-feature
```

---

## ⚡ Works Everywhere!

### For Harmonia:
```bash
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
git worktree add ../harmonia-worktrees/feature-x -b feature-x
cd ../harmonia-worktrees/feature-x && claude
```

### For Savaya:
```bash
cd /Users/studiozo/00_ZØ_CØDE/00_apps/savaya
git worktree add ../savaya-worktrees/feature-x -b feature-x
cd ../savaya-worktrees/feature-x && claude
```

### For TouchDesigner Edits:
```bash
cd /Users/studiozo/00_ZØ_CØDE/00_apps/touchdesigner-edits
git worktree add ../touchdesigner-worktrees/feature-x -b feature-x
cd ../touchdesigner-worktrees/feature-x && claude
```

**Same system, any project!**

---

## ❓ Need Help?

- Full guide: See `/Users/studiozo/01_ZØ_AGENTS/_claude/START_HERE.md`
- Commands: See `/Users/studiozo/01_ZØ_AGENTS/_claude/CHEAT_SHEET.md`
- Troubleshooting: See `/Users/studiozo/01_ZØ_AGENTS/_claude/TROUBLESHOOTING.md`

---

**Ready?** Pick your project and start! 🎉
