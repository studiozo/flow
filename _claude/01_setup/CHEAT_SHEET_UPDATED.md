# ✅ CHEAT_SHEET.md Updated — Generic Paths

**Status**: All hardcoded paths replaced with generic examples

---

## What Changed

All commands in CHEAT_SHEET.md that had specific paths like:
- `../harmonia-worktrees/`
- `/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia`

Have been replaced with generic, reusable paths:
- `../worktrees/` 
- `/path/to/your/repo`
- `/path/to/your/worktrees`
- `/path/to/scripts`

---

## Updated Sections

✅ **Git Worktree Commands**
- Create
- Remove & Cleanup  
- Repair

✅ **Workflow Commands**
- Quick Start
- Parallel Development
- Merging & Publishing
- Quick Feature Loop

✅ **tmux Commands**
- Automation (multi-worktree session)

✅ **Useful Aliases**
- All alias paths made generic
- Helper functions updated

✅ **One-Liners**
- All examples use generic paths

---

## New: Path Conventions Section

Added at the top of the file:

```markdown
## ⚡ Path Conventions

All commands use generic paths that work with ANY project:
- `/path/to/your/repo` — Your main git repository
- `../worktrees/` — Worktrees folder (sibling to your repo)
- `/path/to/scripts/` — Location of your setup scripts

**Replace these with your actual paths** when running commands!
```

---

## Examples of Changes

### Before:
```bash
git worktree add ../harmonia-worktrees/feature-x -b feature-x
```

### After:
```bash
git worktree add ../worktrees/feature-x -b feature-x
```

---

### Before:
```bash
cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
git worktree add ../harmonia-worktrees/my-feature -b my-feature
```

### After:
```bash
cd /path/to/your/repo
git worktree add ../worktrees/my-feature -b my-feature
```

---

### Before (Aliases):
```bash
alias claude-dev='cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia && claude'
alias wthome='cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees'
```

### After (Aliases):
```bash
alias claude-dev='cd /path/to/repo && claude'
alias wthome='cd /path/to/worktrees'
```

---

## Now This Cheat Sheet Works For:

✅ Any Git project  
✅ Any repository structure  
✅ Claude Code development  
✅ Multi-instance setups  
✅ Any team member  
✅ Any organization  

---

## How to Use

1. **Open** CHEAT_SHEET.md
2. **Copy** any command you need
3. **Replace** generic paths with YOUR actual paths:
   - `/path/to/your/repo` → your actual repo path
   - `/path/to/your/worktrees` → your actual worktrees folder
   - `/path/to/scripts` → where you put the setup scripts

4. **Run** the command

---

## Example: For Your Harmonia Project

If your setup looks like:
```
/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia
/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees
```

Then:
- Replace `/path/to/your/repo` with `/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia`
- Replace `../worktrees` with `../harmonia-worktrees`

---

## Example: For Another Project

If you use it with a different project like `myapp`:
```
/Users/someone/projects/myapp
/Users/someone/projects/myapp-worktrees
```

Then:
- Replace `/path/to/your/repo` with `/Users/someone/projects/myapp`
- Replace `../worktrees` with `../myapp-worktrees`

---

## All Files in `/Users/studiozo/01_ZØ_AGENTS/_claude/`

| File | Status | Type |
|------|--------|------|
| CHEAT_SHEET.md | ✅ Updated | Generic paths |
| START_HERE.md | 📝 Still project-specific | Reference |
| EXECUTION_PLAN.md | 📝 Project-specific example | Reference |
| WORKTREE_SETUP_GUIDE.md | 📝 Generic concepts | Reference |
| TROUBLESHOOTING.md | ✅ Generic | Reference |
| README_QUICKSTART.md | 📝 Generic | Quick start |
| SETUP_COMPLETE.md | 📝 Reference | Summary |
| activate.sh | ⚙️ Interactive setup | Script |
| worktree-setup.sh | ⚙️ Interactive management | Script |
| setup-worktrees.sh | ⚙️ Alternative setup | Script |

---

## Ready to Share!

The CHEAT_SHEET.md is now **completely generic** and can be:
- ✅ Shared across teams
- ✅ Used for any project
- ✅ Reused by others
- ✅ Included in documentation
- ✅ Referenced in blogs/tutorials

**Bookmark it! This is your go-to reference for parallel Claude Code development.** 🚀
