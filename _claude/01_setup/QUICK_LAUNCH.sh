#!/bin/bash
# 🎯 QUICK LAUNCH GUIDE
# Claude Code × Git Worktrees Setup
# 
# Generated: February 5, 2026
# Status: ✅ READY TO USE

cat << 'EOF'

╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║              🚀 CLAUDE CODE × GIT WORKTREES — QUICK LAUNCH                 ║
║                                                                              ║
║                     Your Parallel Development System is Ready!              ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

📦 WHAT YOU HAVE
════════════════════════════════════════════════════════════════════════════════

✅ Complete Setup System
   • 11 files total (97 KB)
   • 8 documentation files
   • 3 executable scripts
   • All scripts are ready to run

✅ Ready Features
   • Automated setup (activate.sh)
   • Interactive management (worktree-setup.sh)
   • Git worktrees support
   • Claude CLI integration
   • Parallel session management
   • Complete documentation
   • Comprehensive troubleshooting


🚀 THREE WAYS TO START
════════════════════════════════════════════════════════════════════════════════

┌─────────────────────────────────────────────────────────────────────────────┐
│ OPTION 1: AUTOMATED (⚡ RECOMMENDED - 15 minutes)                           │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  /Users/studiozo/01_ZØ_AGENTS/_claude/activate.sh                          │
│                                                                              │
│  This will:                                                                 │
│  ✓ Check dependencies                                                       │
│  ✓ Verify GitHub authentication                                            │
│  ✓ Create worktree directory                                               │
│  ✓ Set up initial worktrees                                                │
│  ✓ Launch parallel Claude sessions                                         │
│  ✓ Add shell aliases                                                        │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────┐
│ OPTION 2: INTERACTIVE MENU (🎮 STEP-BY-STEP - 20 minutes)                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia                            │
│  /Users/studiozo/01_ZØ_AGENTS/_claude/worktree-setup.sh                    │
│                                                                              │
│  Then choose from menu:                                                     │
│  1) Create new worktree                                                     │
│  2) List worktrees                                                          │
│  3) Launch Claude in worktree                                               │
│  4) Launch all in parallel                                                  │
│  5) Remove worktree                                                         │
│  q) Quit                                                                     │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────┐
│ OPTION 3: MANUAL (📚 LEARN FIRST - 30 minutes)                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  1. Read the guide:                                                         │
│     cat /Users/studiozo/01_ZØ_AGENTS/_claude/START_HERE.md                 │
│                                                                              │
│  2. Follow the instructions manually                                        │
│                                                                              │
│  3. Or run the automated script when ready:                                 │
│     /Users/studiozo/01_ZØ_AGENTS/_claude/activate.sh                       │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘


📖 DOCUMENTATION FILES
════════════════════════════════════════════════════════════════════════════════

START HERE:
  START_HERE.md ..................... Master dashboard & navigation

THEN CHOOSE YOUR PATH:
  EXECUTION_PLAN.md ................ Step-by-step 45-minute guide
  WORKTREE_SETUP_GUIDE.md .......... Detailed technical reference
  README_QUICKSTART.md ............. 3-step quick start

KEEP THESE BOOKMARKED:
  CHEAT_SHEET.md ................... Command reference
  TROUBLESHOOTING.md ............... Problem solving

REFERENCE:
  SETUP_COMPLETE.md ................ Completion summary
  FILE_INDEX.md .................... This file index


🎯 FASTEST PATH (5 MINUTES)
════════════════════════════════════════════════════════════════════════════════

Just run this:

  /Users/studiozo/01_ZØ_AGENTS/_claude/activate.sh

Then follow the interactive prompts. Done! ✨


🔥 NEXT STEPS AFTER ACTIVATION
════════════════════════════════════════════════════════════════════════════════

1. Create your first worktree:
   git worktree add ../harmonia-worktrees/feature-auth -b feature-auth

2. Launch Claude:
   cd ../harmonia-worktrees/feature-auth && claude

3. Inside Claude, rename your session:
   /rename feature-auth-dev

4. Create another worktree in a new terminal:
   git worktree add ../harmonia-worktrees/feature-payments -b feature-payments
   cd ../harmonia-worktrees/feature-payments && claude

5. In the second Claude, rename it:
   /rename feature-payments-dev

6. Switch between sessions:
   /resume (in any Claude session)


⚙️ IMPORTANT: BEFORE YOU START
════════════════════════════════════════════════════════════════════════════════

Verify you have:

  ✓ Git installed:
    git --version

  ✓ Claude CLI installed:
    claude --version
    (if missing: brew install anthropic-cli)

  ✓ GitHub authentication working:
    gh auth status OR ssh -T git@github.com
    (if missing: see TROUBLESHOOTING.md → Section 1)

  ✓ Write access to repo:
    /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia exists


🎮 QUICK COMMANDS
════════════════════════════════════════════════════════════════════════════════

Create worktree:
  git worktree add ../harmonia-worktrees/<name> -b <name>

List worktrees:
  git worktree list

Remove worktree:
  git worktree remove ../harmonia-worktrees/<name>

Launch Claude:
  claude

Rename session (inside Claude):
  /rename my-session-name

Switch sessions (inside Claude):
  /resume

See all commands:
  cat /Users/studiozo/01_ZØ_AGENTS/_claude/CHEAT_SHEET.md


❓ QUICK TROUBLESHOOTING
════════════════════════════════════════════════════════════════════════════════

Issue: "Permission denied"
  Fix: chmod +x /Users/studiozo/01_ZØ_AGENTS/_claude/*.sh

Issue: "claude: command not found"
  Fix: brew install anthropic-cli

Issue: "Authentication failed"
  Fix: gh auth login OR ssh-keygen

Issue: "Already checked out"
  Fix: Use -b flag: git worktree add <path> -b <name>

More help:
  cat /Users/studiozo/01_ZØ_AGENTS/_claude/TROUBLESHOOTING.md


📊 FILE SUMMARY
════════════════════════════════════════════════════════════════════════════════

Location: /Users/studiozo/01_ZØ_AGENTS/_claude/

Documentation (8 files):
  • START_HERE.md (11 KB)
  • EXECUTION_PLAN.md (7.8 KB)
  • WORKTREE_SETUP_GUIDE.md (7.3 KB)
  • README_QUICKSTART.md (2.4 KB)
  • CHEAT_SHEET.md (9.3 KB)
  • TROUBLESHOOTING.md (13 KB)
  • SETUP_COMPLETE.md (11 KB)
  • FILE_INDEX.md (10 KB)

Scripts (3 files, all executable):
  • activate.sh (14 KB) ⭐ Recommended
  • worktree-setup.sh (8.4 KB)
  • setup-worktrees.sh (5.7 KB)

Total: ~99 KB of complete, production-ready setup


🏁 MAKE YOUR CHOICE
════════════════════════════════════════════════════════════════════════════════

👉 READY? Pick one:

   1️⃣  Just run it (FASTEST):
       /Users/studiozo/01_ZØ_AGENTS/_claude/activate.sh

   2️⃣  Read first, then run (SMART):
       cat /Users/studiozo/01_ZØ_AGENTS/_claude/START_HERE.md

   3️⃣  Learn everything first (THOROUGH):
       cat /Users/studiozo/01_ZØ_AGENTS/_claude/EXECUTION_PLAN.md


🎉 YOU'RE READY TO GO!
════════════════════════════════════════════════════════════════════════════════

Everything is set up and waiting for you. Choose one of the options above
and you'll be running parallel Claude Code instances in minutes!

Questions? See TROUBLESHOOTING.md
Commands? See CHEAT_SHEET.md
Full guide? See START_HERE.md


═══════════════════════════════════════════════════════════════════════════════

                              Happy Coding! 🚀

═══════════════════════════════════════════════════════════════════════════════

EOF

# End of guide
