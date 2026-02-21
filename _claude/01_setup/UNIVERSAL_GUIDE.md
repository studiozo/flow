# 🌍 Universal Guide: Use with ANY Project

**Status**: ✅ COMPLETE & READY FOR ANY PROJECT

---

## 📌 Key Concept

This system in `/Users/studiozo/01_ZØ_AGENTS/_claude/` is **NOT** specific to harmonia.

It's a **universal tool** you can use with ANY Git repository:
- harmonia ✅
- savaya ✅
- touchdesigner-edits ✅
- Any other project ✅

---

## 🎯 How It Works

### For ANY Project:

```bash
# 1. Navigate to YOUR project
cd /path/to/your/project

# 2. Create worktrees folder
mkdir -p ../project-worktrees

# 3. Create a worktree
git worktree add ../project-worktrees/feature-name -b feature-name

# 4. Launch Claude
cd ../project-worktrees/feature-name
claude
```

---

## 📁 Directory Structure

For ANY project, you create this structure:

```
/path/to/your/project/                 ← Your repo (main branch)
/path/to/your/project-worktrees/       ← Worktrees folder
  ├── feature-a/                       ← Feature A worktree
  ├── feature-b/                       ← Feature B worktree
  └── bugfix-c/                        ← Bugfix worktree
```

---

## 🔄 Examples for Different Projects

### For Harmonia:
```bash
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
mkdir -p ../harmonia-worktrees
git worktree add ../harmonia-worktrees/feature-x -b feature-x
cd ../harmonia-worktrees/feature-x && claude
```

### For Savaya:
```bash
cd /Users/studiozo/00_ZØ_CØDE/00_apps/savaya
mkdir -p ../savaya-worktrees
git worktree add ../savaya-worktrees/feature-x -b feature-x
cd ../savaya-worktrees/feature-x && claude
```

### For TouchDesigner:
```bash
cd /Users/studiozo/00_ZØ_CØDE/00_apps/touchdesigner-edits
mkdir -p ../touchdesigner-worktrees
git worktree add ../touchdesigner-worktrees/feature-x -b feature-x
cd ../touchdesigner-worktrees/feature-x && claude
```

### For Your Own Project:
```bash
cd /path/to/my/project
mkdir -p ../my-project-worktrees
git worktree add ../my-project-worktrees/feature-x -b feature-x
cd ../my-project-worktrees/feature-x && claude
```

**See the pattern? It's the same for everything!**

---

## ⚙️ How to Use the System

### The Tools (`/Users/studiozo/01_ZØ_AGENTS/_claude/`)

#### 📄 Documentation (Read These)
- **START_HERE.md** — Entry point & navigation
- **CHEAT_SHEET.md** — All commands (generic paths)
- **README_QUICKSTART.md** — 3-step quick start
- **TROUBLESHOOTING.md** — Problem solving
- **EXECUTION_PLAN.md** — Step-by-step setup
- **WORKTREE_SETUP_GUIDE.md** — Deep technical reference

#### ⚙️ Scripts (Run These)
- **activate.sh** — Automated setup (interactive)
- **worktree-setup.sh** — Interactive worktree manager
- **setup-worktrees.sh** — Alternative setup script

---

## 🚀 Quick Start with ANY Project

### 1. Prepare
```bash
# Go to your project
cd /path/to/your/project

# Make sure it's a git repo
git status

# Create worktrees folder
mkdir -p ../project-worktrees
```

### 2. Authenticate (One-Time)
```bash
# GitHub CLI
gh auth login

# OR SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# OR Personal Access Token
# (see TROUBLESHOOTING.md)
```

### 3. Create Worktrees
```bash
# From your project directory
cd /path/to/your/project

# Create first worktree
git worktree add ../project-worktrees/feature-a -b feature-a

# Create second worktree
git worktree add ../project-worktrees/feature-b -b feature-b
```

### 4. Launch Claude in Parallel
```bash
# Terminal 1
cd ../project-worktrees/feature-a && claude
# Inside: /rename feature-a-dev

# Terminal 2
cd ../project-worktrees/feature-b && claude
# Inside: /rename feature-b-dev

# In any Claude: /resume to switch sessions
```

---

## 📖 Using the Documentation

### Find What You Need:

| I want to... | Read... |
|-------------|---------|
| Get started fast | README_QUICKSTART.md |
| Understand the system | START_HERE.md |
| See all commands | CHEAT_SHEET.md |
| Step-by-step setup | EXECUTION_PLAN.md |
| Something's broken | TROUBLESHOOTING.md |
| Deep technical details | WORKTREE_SETUP_GUIDE.md |

### Key Point:
All commands use **generic paths** like:
- `/path/to/your/project`
- `../project-worktrees`
- `/path/to/scripts`

**Replace these with YOUR actual paths** when you run them!

---

## 💡 Generic Path Template

Whenever you see a command like:
```bash
cd /path/to/your/repo
git worktree add ../worktrees/feature-x -b feature-x
cd ../worktrees/feature-x && claude
```

Replace the placeholders:
- `/path/to/your/repo` → Your actual repo path
- `../worktrees` → Your worktrees folder name
- `feature-x` → Your branch/feature name

---

## 🔗 File Paths in This System

All scripts and docs are in:
```
/Users/studiozo/01_ZØ_AGENTS/_claude/
├── *.md ..................... Documentation
├── *.sh ..................... Scripts
└── (This is your TOOLS folder!)
```

Use this folder with ANY project!

---

## 🎯 Workflow for Any Project

```
1. Navigate to project
   cd /path/to/project

2. Create worktree
   git worktree add ../project-worktrees/feature-name -b feature-name

3. Launch Claude
   cd ../project-worktrees/feature-name && claude

4. Work (multiple terminals for multiple features)
   cd ../project-worktrees/feature-b && claude

5. Switch between sessions
   /resume (inside Claude)

6. Merge when done
   git checkout main && git merge feature-name

7. Clean up
   git worktree remove ../project-worktrees/feature-name
```

---

## ✨ Works for:

✅ Harmonia  
✅ Savaya  
✅ TouchDesigner edits  
✅ Any Git repository  
✅ Any project size  
✅ Any team  
✅ Any workflow  

---

## 🚀 Next Steps

1. **Pick a project** — harmonia, savaya, touchdesigner, or your own
2. **Read** README_QUICKSTART.md
3. **Run** `/Users/studiozo/01_ZØ_AGENTS/_claude/activate.sh`
4. **Follow prompts** — it will guide you
5. **Start working** in parallel Claude instances!

---

## 📚 Full Documentation Index

```
/Users/studiozo/01_ZØ_AGENTS/_claude/

📖 Documentation:
   START_HERE.md ................... Dashboard & navigation
   README_QUICKSTART.md ........... 3-step quick start ⭐
   EXECUTION_PLAN.md ............. Step-by-step setup
   CHEAT_SHEET.md ................. Command reference
   WORKTREE_SETUP_GUIDE.md ........ Technical details
   TROUBLESHOOTING.md ............. Problem solving
   FILE_INDEX.md .................. File listing
   CHEAT_SHEET_UPDATED.md ......... Change summary
   UNIVERSAL_GUIDE.md ............. This file!

⚙️ Scripts:
   activate.sh .................... Setup wizard ⭐
   worktree-setup.sh .............. Interactive manager
   setup-worktrees.sh ............. Alternative setup
   QUICK_LAUNCH.sh ................ Quick reference display
```

---

## 🎉 You're Ready!

This system works with ANY project. Just:

1. **Pick your project** (harmonia, savaya, etc.)
2. **Follow the 3 steps** in README_QUICKSTART.md
3. **Run activate.sh** for guided setup
4. **Start developing** in parallel!

---

**Questions?** Check the docs in `/Users/studiozo/01_ZØ_AGENTS/_claude/`

**Ready?** Pick your project and start! 🚀
