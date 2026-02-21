#!/bin/bash
# ============================================================
# 🚀 One-Click Activation: Claude Code × Git Worktrees
# ============================================================
# Usage: ./activate.sh
# This script automates the entire setup process
# ============================================================

set -e

BOLD="\033[1m"
DIM="\033[2m"
GREEN="\033[32m"
CYAN="\033[36m"
YELLOW="\033[33m"
RED="\033[31m"
RESET="\033[0m"

REPO_DIR="/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia"
WORKTREE_BASE="/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees"
SCRIPTS_DIR="/Users/studiozo/01_ZØ_AGENTS/_claude"

# ────────────────────────────────────────────────────────────
# HELPERS
# ────────────────────────────────────────────────────────────

step() {
    echo ""
    echo -e "${BOLD}${CYAN}▶ $1${RESET}"
}

success() {
    echo -e "  ${GREEN}✓${RESET} $1"
}

warning() {
    echo -e "  ${YELLOW}⚠${RESET} $1"
}

error() {
    echo -e "  ${RED}✗${RESET} $1"
}

print_header() {
    echo ""
    echo -e "${BOLD}${CYAN}╔═══════════════════════════════════════════════════╗${RESET}"
    echo -e "${BOLD}${CYAN}║  🚀 Claude Code × Git Worktrees Activation       ║${RESET}"
    echo -e "${BOLD}${CYAN}║                                                   ║${RESET}"
    echo -e "${BOLD}${CYAN}║  This script will:                                ║${RESET}"
    echo -e "${BOLD}${CYAN}║  • Check dependencies                             ║${RESET}"
    echo -e "${BOLD}${CYAN}║  • Verify GitHub authentication                  ║${RESET}"
    echo -e "${BOLD}${CYAN}║  • Create worktree directories                   ║${RESET}"
    echo -e "${BOLD}${CYAN}║  • Set up initial worktrees                      ║${RESET}"
    echo -e "${BOLD}${CYAN}║  • Launch parallel Claude sessions               ║${RESET}"
    echo -e "${BOLD}${CYAN}╚═══════════════════════════════════════════════════╝${RESET}"
    echo ""
}

check_command() {
    if command -v "$1" &> /dev/null; then
        success "$2"
        return 0
    else
        warning "$2 (not found, will try to install)"
        return 1
    fi
}

confirm() {
    read -r -p "$1 [Y/n] " yn
    case "$yn" in
        [Nn]*) return 1 ;;
        *) return 0 ;;
    esac
}

# ────────────────────────────────────────────────────────────
# SETUP STEPS
# ────────────────────────────────────────────────────────────

setup_step_1() {
    step "Step 1: Checking Dependencies"
    
    check_command "git" "Git"
    check_command "claude" "Claude CLI"
    check_command "tmux" "tmux (optional)"
    
    echo ""
    warning "If any dependencies are missing, install them first:"
    echo -e "  ${DIM}• Claude: brew install anthropic-cli${RESET}"
    echo -e "  ${DIM}• tmux: brew install tmux${RESET}"
}

setup_step_2() {
    step "Step 2: Checking GitHub Authentication"
    
    if command -v gh &> /dev/null; then
        if gh auth status &> /dev/null; then
            success "GitHub CLI authenticated"
            return 0
        fi
    fi
    
    if [ -f ~/.ssh/id_ed25519 ]; then
        if ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
            success "SSH authentication verified"
            return 0
        fi
    fi
    
    warning "GitHub authentication not detected"
    echo ""
    echo "Choose an authentication method:"
    echo "  1) GitHub CLI (recommended)"
    echo "  2) SSH Key"
    echo "  3) Personal Access Token"
    echo "  4) Skip for now"
    echo ""
    read -r -p "Choice (1-4): " auth_choice
    
    case "$auth_choice" in
        1)
            if command -v gh &> /dev/null; then
                gh auth login
            else
                echo "GitHub CLI not installed. Install with: brew install gh"
                echo "Then run: gh auth login"
            fi
            ;;
        2)
            echo "Generating SSH key..."
            ssh-keygen -t ed25519 -C "claude-worktrees"
            echo "Add this key to GitHub: https://github.com/settings/keys"
            cat ~/.ssh/id_ed25519.pub | pbcopy
            echo "Public key copied to clipboard!"
            ;;
        3)
            echo "Create token at: https://github.com/settings/tokens"
            echo "Then configure git: git config --global credential.helper osxkeychain"
            ;;
        4)
            warning "Skipping authentication (you can set it up later)"
            ;;
    esac
}

setup_step_3() {
    step "Step 3: Setting Up Directory Structure"
    
    if [ ! -d "$REPO_DIR" ]; then
        error "Repository directory not found: $REPO_DIR"
        echo ""
        read -r -p "Enter your repository path: " REPO_DIR
    fi
    success "Repository: $REPO_DIR"
    
    mkdir -p "$WORKTREE_BASE"
    success "Worktree base directory: $WORKTREE_BASE"
    
    cd "$REPO_DIR"
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        error "Not a git repository: $REPO_DIR"
        exit 1
    fi
    success "Git repository verified"
}

setup_step_4() {
    step "Step 4: Making Scripts Executable"
    
    chmod +x "$SCRIPTS_DIR/setup-worktrees.sh"
    chmod +x "$SCRIPTS_DIR/worktree-setup.sh"
    chmod +x "$SCRIPTS_DIR/activate.sh"
    
    success "Setup scripts are executable"
    
    ls -la "$SCRIPTS_DIR"/*.sh | grep -E 'setup|worktree|activate' | awk '{print "  " $9}' | while read f; do
        echo -e "    ${DIM}$f${RESET}"
    done
}

setup_step_5() {
    step "Step 5: Creating Initial Worktrees"
    
    cd "$REPO_DIR"
    
    # Check if worktrees already exist
    if git worktree list | grep -q "$WORKTREE_BASE"; then
        warning "Worktrees already exist"
        git worktree list
        return 0
    fi
    
    echo ""
    echo "How many initial worktrees to create?"
    echo "  1) 2 worktrees (feature-a, feature-b)"
    echo "  2) 3 worktrees (feature-a, feature-b, bugfix-c)"
    echo "  3) Custom number"
    echo "  4) None (set up manually later)"
    echo ""
    read -r -p "Choice (1-4): " wt_choice
    
    case "$wt_choice" in
        1)
            create_worktree "feature-a"
            create_worktree "feature-b"
            ;;
        2)
            create_worktree "feature-a"
            create_worktree "feature-b"
            create_worktree "bugfix-c"
            ;;
        3)
            read -r -p "Number of worktrees: " num
            for ((i=1; i<=num; i++)); do
                read -r -p "Name for worktree $i: " name
                create_worktree "$name"
            done
            ;;
        4)
            warning "Skipping worktree creation"
            ;;
    esac
    
    echo ""
    success "Initial worktrees created:"
    git worktree list
}

create_worktree() {
    local name="$1"
    local path="$WORKTREE_BASE/$name"
    
    if [ -d "$path" ]; then
        warning "Worktree already exists: $name"
        return
    fi
    
    echo -n "  Creating worktree '$name'... "
    git worktree add "$path" -b "$name" > /dev/null 2>&1 || \
        git worktree add "$path" "$name" > /dev/null 2>&1
    echo -e "${GREEN}✓${RESET}"
}

setup_step_6() {
    step "Step 6: Launching Parallel Claude Sessions"
    
    cd "$REPO_DIR"
    
    local count=$(git worktree list --porcelain | grep "^worktree " | wc -l)
    
    if [ "$count" -lt 2 ]; then
        warning "Less than 2 worktrees found, skipping parallel launch"
        return
    fi
    
    echo ""
    echo "Launch Claude in parallel worktrees?"
    echo "  1) Yes, using tmux (if available)"
    echo "  2) Yes, open in separate Terminal tabs"
    echo "  3) No, I'll do it manually"
    echo ""
    read -r -p "Choice (1-3): " launch_choice
    
    case "$launch_choice" in
        1)
            if command -v tmux &> /dev/null; then
                echo ""
                echo "Launching Claude in all worktrees with tmux..."
                "$SCRIPTS_DIR/worktree-setup.sh" parallel
            else
                warning "tmux not installed, using separate tabs"
                launch_manual_tabs
            fi
            ;;
        2)
            launch_manual_tabs
            ;;
        3)
            warning "Skipping launch"
            ;;
    esac
}

launch_manual_tabs() {
    cd "$REPO_DIR"
    
    local worktrees
    worktrees=$(git worktree list --porcelain | grep "^worktree " | sed 's/^worktree //' | grep -v "$REPO_DIR")
    
    echo ""
    echo "Opening Claude in separate terminal tabs..."
    
    while IFS= read -r wt; do
        osascript -e "tell application \"Terminal\" to do script \"cd '$wt' && claude\""
        echo "  $(basename "$wt")"
    done <<< "$worktrees"
    
    echo ""
    success "Terminal tabs launched"
}

setup_step_7() {
    step "Step 7: Creating Shell Aliases (Optional)"
    
    if confirm "Add helpful shell aliases to ~/.zshrc?"; then
        cat >> ~/.zshrc << 'EOF'

# Claude Code × Git Worktrees Aliases
alias claude-new='cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia && /Users/studiozo/01_ZØ_AGENTS/_claude/worktree-setup.sh new'
alias claude-list='cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia && git worktree list'
alias claude-launch='cd /Users/studiozo/01_ZØ_AGENTS/_claude && ./worktree-setup.sh parallel'
alias claude-remove='cd /Users/studiozo/00_ZØ_CØDE/00_apps/harmonia && /Users/studiozo/01_ZØ_AGENTS/_claude/worktree-setup.sh remove'
EOF
        
        source ~/.zshrc
        success "Aliases added to ~/.zshrc"
        echo -e "  ${DIM}Usage: claude-new <name>, claude-list, claude-launch, etc.${RESET}"
    fi
}

setup_step_8() {
    step "Step 8: Creating Quick Reference Guide"
    
    cat > "$SCRIPTS_DIR/QUICK_REFERENCE.md" << 'EOF'
# Quick Reference: Claude Code × Git Worktrees

## One-Liners

```bash
# Create a new worktree
git worktree add ../harmonia-worktrees/feature-name -b feature-name

# List all worktrees
git worktree list

# Remove a worktree
git worktree remove ../harmonia-worktrees/feature-name

# Launch Claude in current directory
claude

# Rename Claude session (inside Claude)
/rename my-session-name

# Resume a Claude session (inside Claude)
/resume

# List all Claude sessions across worktrees (inside Claude)
/resume
```

## Directory Structure

```
harmonia/                    ← Main repo (what you git clone'd)
harmonia-worktrees/          ← Worktrees folder
  ├── feature-a/            ← Feature branch worktree
  ├── feature-b/            ← Another feature branch
  └── bugfix-xyz/           ← Bug fix branch
```

## Workflow: Create → Work → Merge → Cleanup

```bash
# 1. Create worktree
git worktree add ../harmonia-worktrees/feature-x -b feature-x

# 2. Work in it
cd ../harmonia-worktrees/feature-x
claude
# ... make changes in Claude ...

# 3. Push changes
git add .
git commit -m "Your message"
git push origin feature-x

# 4. Merge to main
cd ../harmonia
git checkout main
git merge feature-x
git push origin main

# 5. Clean up
git worktree remove ../harmonia-worktrees/feature-x
git branch -d feature-x
```

## Using the Scripts

```bash
# Interactive menu
/Users/studiozo/01_ZØ_AGENTS/_claude/worktree-setup.sh

# Direct commands
./worktree-setup.sh new <name>        # Create and launch new worktree
./worktree-setup.sh list              # List all worktrees
./worktree-setup.sh launch <name>     # Open Claude in worktree
./worktree-setup.sh parallel          # Launch all in parallel
./worktree-setup.sh remove <name>     # Clean up a worktree
```

## tmux Cheat Sheet

```bash
# Attach to session
tmux attach -t claude-parallel

# Switch panes
Ctrl+B → (right), ← (left), ↑ (up), ↓ (down)

# Detach
Ctrl+B D

# List sessions
tmux list-sessions

# Kill session
tmux kill-session -t claude-parallel
```

## Troubleshooting

| Issue | Fix |
|-------|-----|
| "Branch already checked out" | Use `-b` to create new branch: `git worktree add <path> -b <branch>` |
| "Claude not found" | Install: `brew install anthropic-cli` |
| "Authentication failed" | Run `gh auth login` or set up SSH key |
| Dependencies missing | See EXECUTION_PLAN.md Phase 1 |

EOF
    success "Quick reference created: QUICK_REFERENCE.md"
}

# ────────────────────────────────────────────────────────────
# MAIN
# ────────────────────────────────────────────────────────────

main() {
    print_header
    
    setup_step_1
    echo ""
    read -r -p "Continue to Step 2? [Y/n] " yn
    case "$yn" in [Nn]*) exit 0 ;; esac
    
    setup_step_2
    setup_step_3
    setup_step_4
    setup_step_5
    setup_step_6
    setup_step_7
    setup_step_8
    
    # Summary
    step "✨ Activation Complete!"
    echo ""
    echo -e "${BOLD}What's next?${RESET}"
    echo ""
    echo "1. Inside each Claude session, run:"
    echo -e "   ${DIM}/rename <descriptive-name>${RESET}"
    echo ""
    echo "2. Use /resume to switch between sessions"
    echo ""
    echo "3. Create more worktrees anytime:"
    echo -e "   ${DIM}claude-new <name>${RESET}"
    echo ""
    echo "4. View quick reference:"
    echo -e "   ${DIM}cat /Users/studiozo/01_ZØ_AGENTS/_claude/QUICK_REFERENCE.md${RESET}"
    echo ""
    echo -e "${GREEN}Happy coding! 🚀${RESET}"
    echo ""
}

main "$@"
