# 🚀 Claude Code × Git Worktrees — Master Control Dashboard

**Welcome! This is your universal system for parallel Claude Code development across ANY project using Git worktrees.**

---

## 📊 Status: Ready to Use ✅

### What You Have
- ✅ Universal Git worktree setup system
- ✅ Claude CLI integration (works with any project)
- ✅ Parallel session management
- ✅ Comprehensive, reusable documentation
- ✅ Generic troubleshooting guides
- ✅ One-command activation

### What You'll Get
- 🚀 Run 2-4 Claude instances simultaneously on ANY project
- 🔀 Work on different features in parallel without branch switching
- 🔧 Seamless branch management across projects
- 📊 Independent Claude sessions (one per branch/feature)
- 🎯 Full Git integration for any repository

---

## 📁 Documentation Map

```
/Users/studiozo/01_ZØ_AGENTS/_claude/
├── 📄 START_HERE.md ........................ This file! Overview & quick links
├── 🚀 EXECUTION_PLAN.md .................. Step-by-step setup guide (45 min)
├── 📚 README_QUICKSTART.md ............... Quick 3-step start
├── 📖 WORKTREE_SETUP_GUIDE.md ............ Detailed technical guide
├── 🎯 CHEAT_SHEET.md ..................... Command reference & aliases
├── 🔧 TROUBLESHOOTING.md ................. Common issues & fixes
├── ⚡ activate.sh ........................ One-command activation script
├── 🎮 worktree-setup.sh .................. Interactive worktree manager
└── 🎮 setup-worktrees.sh ................. Alternative setup script

📝 Note: This folder is your UNIVERSAL TOOL for any project!
   Use it with: harmonia, savaya, touchdesigner, etc.
```

---

## ⚡ Quick Start (5 minutes)

### Option A: Automated (Recommended)
```bash
# Make scripts executable
chmod +x /Users/studiozo/01_ZØ_AGENTS/_claude/*.sh

# Run activation
/Users/studiozo/01_ZØ_AGENTS/_claude/activate.sh
```

### Option B: Interactive Menu
```bash
# Navigate to your repo
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia

# Run the interactive script
/Users/studiozo/01_ZØ_AGENTS/_claude/worktree-setup.sh
# Choose options from menu
```

### Option C: Manual (Full Control)
```bash
# Create first worktree
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
git worktree add ../harmonia-worktrees/feature-a -b feature-a

# Launch Claude
cd ../harmonia-worktrees/feature-a
claude
```

---

## 🎯 Choose Your Path

### Path 1: "Just Get Started Fast" ⚡
1. Run activation script
2. Follow interactive prompts
3. Launch Claude sessions
4. Start coding!

**Time: ~15 minutes**

→ **File to read:** EXECUTION_PLAN.md (Phase 1-5)

---

### Path 2: "I Want to Understand It First" 📚
1. Read WORKTREE_SETUP_GUIDE.md (concepts)
2. Read README_QUICKSTART.md (overview)
3. Run manual setup
4. Refer to CHEAT_SHEET.md while working

**Time: ~30 minutes**

→ **Files to read:** WORKTREE_SETUP_GUIDE.md → README_QUICKSTART.md → CHEAT_SHEET.md

---

### Path 3: "I'm Experienced, Just Give Me Tools" 🛠️
1. Look at CHEAT_SHEET.md for all commands
2. Use activate.sh or worktree-setup.sh
3. Troubleshoot with TROUBLESHOOTING.md if needed

**Time: ~5 minutes**

→ **Files to read:** CHEAT_SHEET.md → TROUBLESHOOTING.md

---

## 📋 Pre-flight Checklist

Before you start, verify you have:

- [ ] **Git installed**: `git --version`
- [ ] **Claude CLI installed**: `claude --version`
- [ ] **GitHub authentication**: `gh auth status` OR `ssh -T git@github.com`
- [ ] **Access to your repo**: `/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia` exists
- [ ] **Write permissions**: Can create files in that directory

**Missing something?** See TROUBLESHOOTING.md → Section 1-2

---

## 🚀 The 5-Phase Quick Activation

### Phase 1: Prerequisites (5 min)
```bash
# Verify tools
git --version
claude --version

# Verify auth
gh auth status
# If fails, run: gh auth login
```

### Phase 2: Setup (5 min)
```bash
chmod +x /Users/studiozo/01_ZØ_AGENTS/_claude/*.sh
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
mkdir -p ../harmonia-worktrees
```

### Phase 3: Create Worktrees (10 min)
```bash
# Create first worktree
git worktree add ../harmonia-worktrees/feature-a -b feature-a

# Create second worktree
git worktree add ../harmonia-worktrees/feature-b -b feature-b
```

### Phase 4: Launch Claude (5 min)
```bash
# Terminal 1
cd ../harmonia-worktrees/feature-a && claude
# Inside: /rename feature-a-dev

# Terminal 2 (new tab)
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees/feature-b && claude
# Inside: /rename feature-b-dev
```

### Phase 5: Switch Between Sessions (1 min)
```
Inside any Claude session:
/resume
# Shows all sessions across all worktrees
# Select one to switch
```

**Total Time: ~25 minutes to parallel Claude development! 🎉**

---

## 💡 Understanding the Concept

### What Are Git Worktrees?
Git worktrees let you check out multiple branches **simultaneously** in separate directories, all sharing the same Git history.

```
harmonia/                  ← Main repo (primary branch)
harmonia-worktrees/
  ├── feature-a/          ← Feature A branch (independent)
  ├── feature-b/          ← Feature B branch (independent)
  └── bugfix-c/           ← Bug fix branch (independent)
```

### Why This Matters
- ✅ Work on multiple features simultaneously
- ✅ No need to switch branches constantly
- ✅ Independent Claude Code sessions
- ✅ Full Git integration
- ✅ Easy merging when done

### How Claude Fits In
- Each worktree can run its own Claude Code instance
- Use `/resume` to switch between sessions
- All sessions share the same project structure
- Changes in one worktree don't affect others

---

## 🎮 Common Workflows

### Workflow 1: Create & Work
```bash
# Create new feature
git worktree add ../harmonia-worktrees/feature-payments -b feature-payments

# Launch Claude
cd ../harmonia-worktrees/feature-payments
claude

# Inside Claude: /rename feature-payments-dev
```

### Workflow 2: Parallel Development
```bash
# Terminal 1 - Feature A
cd ../harmonia-worktrees/feature-a && claude

# Terminal 2 - Feature B
cd ../harmonia-worktrees/feature-b && claude

# Switch between them
/resume  # In any Claude session
```

### Workflow 3: Merge & Cleanup
```bash
# Merge to main
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
git checkout main
git merge feature-a
git push

# Clean up
git worktree remove ../harmonia-worktrees/feature-a
git branch -d feature-a
```

---

## 🔗 Directory Structure (Expected)

```
/Users/studiozo/
├── 00_ZØ_CØDE/
│   └── 00_apps/
│       ├── harmonia/                    ← Your main repo
│       │   ├── .git/
│       │   ├── src/
│       │   └── ... (your project files)
│       │
│       └── harmonia-worktrees/          ← Worktrees folder
│           ├── feature-a/              ← Separate checkout of feature-a branch
│           ├── feature-b/              ← Separate checkout of feature-b branch
│           └── bugfix-c/               ← Separate checkout of bugfix-c branch
│
└── 01_ZØ_AGENTS/
    └── _claude/                        ← Scripts & docs (THIS FOLDER)
        ├── activate.sh                 ← One-command activation
        ├── worktree-setup.sh           ← Interactive manager
        ├── setup-worktrees.sh          ← Alternative manager
        └── *.md                        ← Documentation files
```

---

## 📚 Documentation Quick Links

| Need | Read |
|------|------|
| Just want to get started | EXECUTION_PLAN.md |
| 3-step quick start | README_QUICKSTART.md |
| Full technical details | WORKTREE_SETUP_GUIDE.md |
| Command reference | CHEAT_SHEET.md |
| Something went wrong | TROUBLESHOOTING.md |
| Git worktree concepts | WORKTREE_SETUP_GUIDE.md Part 2 |
| Claude commands | CHEAT_SHEET.md Claude CLI Commands |
| tmux tips | CHEAT_SHEET.md tmux Commands |

---

## ✅ Success Indicators

You'll know you're successful when:

- ✅ `git worktree list` shows 2+ worktrees
- ✅ Claude launches without errors in each worktree
- ✅ `/resume` shows multiple sessions
- ✅ You can switch between sessions
- ✅ Changes in one worktree don't affect others
- ✅ You can merge work back to main

---

## 🆘 Quick Troubleshooting

| Issue | Fix |
|-------|-----|
| "command not found: claude" | `brew install anthropic-cli` |
| "Authentication failed" | `gh auth login` or set up SSH key |
| "Already checked out" | Use `-b` flag: `git worktree add <path> -b <name>` |
| "Permission denied" | `chmod +x *.sh` |
| Can't find worktrees | Check path: `/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees/` |

**More help?** See TROUBLESHOOTING.md

---

## 🎓 Learning Resources

### 5-Minute Overview
- Start with README_QUICKSTART.md
- Run activate.sh
- Launch first session

### 30-Minute Deep Dive
- Read WORKTREE_SETUP_GUIDE.md
- Study CHEAT_SHEET.md
- Try manual workflows

### Reference While Working
- Keep CHEAT_SHEET.md handy
- Use TROUBLESHOOTING.md when stuck
- Bookmark EXECUTION_PLAN.md Phase 5 for parallel launching

---

## 🎯 Next Steps

### Right Now (Choose One):

**Option A - Fast Track** ⚡
```bash
/Users/studiozo/01_ZØ_AGENTS/_claude/activate.sh
# Follow prompts
```

**Option B - Manual Control** 🎮
```bash
# Read first
cat /Users/studiozo/01_ZØ_AGENTS/_claude/EXECUTION_PLAN.md
# Then follow steps
```

**Option C - Learn First** 📚
```bash
# Read first
cat /Users/studiozo/01_ZØ_AGENTS/_claude/WORKTREE_SETUP_GUIDE.md
# Then run activate.sh
```

---

## 💬 Quick Reference Commands

```bash
# Setup
activate.sh                                    # Automated setup
worktree-setup.sh                              # Interactive menu

# Management
git worktree add <path> -b <name>              # Create worktree
git worktree list                              # List all
git worktree remove <path>                     # Remove worktree

# Development
claude                                         # Launch Claude
/rename my-feature-name                        # Rename session
/resume                                        # Switch sessions

# Publishing
git add .                                      # Stage changes
git commit -m "message"                        # Commit
git push origin branch-name                    # Push branch
git merge branch-name                          # Merge to main
git push origin main                           # Push to main

# Cleanup
git worktree remove <path>                     # Remove worktree
git branch -d branch-name                      # Delete branch
git worktree prune                             # Clean metadata
```

---

## 📊 Time Estimates

| Task | Time | Effort |
|------|------|--------|
| Prerequisites check | 5 min | ⚡ Low |
| Run activation script | 10 min | ⚡ Low |
| Create 2 worktrees | 5 min | ⚡ Low |
| Launch 2 Claude sessions | 5 min | ⚡ Low |
| Do first parallel work | 10 min | ⚡ Low |
| **First parallel session total** | **35 min** | **⚡ Low** |
| Advanced tmux setup | 15 min | 🔧 Medium |
| Master multiple sessions | 30 min | 🔧 Medium |

---

## 🎉 You're Ready!

Everything is set up. You have:
- ✅ Complete scripts
- ✅ Full documentation  
- ✅ Troubleshooting guides
- ✅ Command references
- ✅ Step-by-step instructions

**👉 Choose your path above and start!**

---

## 📞 Questions?

- **Setup questions?** → EXECUTION_PLAN.md
- **Command help?** → CHEAT_SHEET.md
- **Technical details?** → WORKTREE_SETUP_GUIDE.md
- **Something broken?** → TROUBLESHOOTING.md
- **Quick reference?** → README_QUICKSTART.md

---

## 🏁 Remember

1. **Start small** - Create 2 worktrees, not 10
2. **Name sessions** - Use `/rename` immediately
3. **Commit often** - Don't save all work at end
4. **Test merge** - Merge to main frequently
5. **Clean up** - Remove worktrees when done

**Happy parallel development! 🚀**
