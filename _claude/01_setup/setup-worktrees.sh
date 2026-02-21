#!/bin/bash

# Git Worktrees + Claude Code Setup Script
# This script helps you set up parallel Claude Code sessions using git worktrees

set -e  # Exit on error

REPO_DIR="/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia"
WORKTREE_BASE="/Users/studiozo/00_ZØ_CØDE/00_apps/harmonia-worktrees"

echo "🔧 Git Worktrees + Claude Code Setup"
echo "======================================"
echo ""

# Check if in git repo
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Not a git repository. Initializing..."
    git init
    echo "✅ Git repository initialized"
fi

# Function to check GitHub authentication
check_github_auth() {
    echo "🔐 Checking GitHub authentication..."

    # Check if gh CLI is installed
    if command -v gh &> /dev/null; then
        if gh auth status &> /dev/null; then
            echo "✅ GitHub CLI authenticated"
            return 0
        else
            echo "⚠️  GitHub CLI installed but not authenticated"
            echo "   Run: gh auth login"
            return 1
        fi
    fi

    # Check if SSH key exists and is added to agent
    if [ -f ~/.ssh/id_ed25519 ] || [ -f ~/.ssh/id_rsa ]; then
        if ssh-add -l &> /dev/null; then
            echo "✅ SSH key found in agent"
            if ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
                echo "✅ SSH authentication to GitHub works"
                return 0
            fi
        fi
        echo "⚠️  SSH key exists but may not be configured for GitHub"
        return 1
    fi

    echo "⚠️  No GitHub authentication detected"
    echo ""
    echo "Choose authentication method:"
    echo "  1) GitHub CLI (recommended)     - brew install gh && gh auth login"
    echo "  2) SSH key                      - See WORKTREE_SETUP_GUIDE.md"
    echo "  3) Personal Access Token (PAT)  - See WORKTREE_SETUP_GUIDE.md"
    echo ""
    return 1
}

# Function to create worktree
create_worktree() {
    local branch_name=$1
    local worktree_path="$WORKTREE_BASE/$branch_name"

    if [ -d "$worktree_path" ]; then
        echo "⚠️  Worktree already exists: $worktree_path"
        return 1
    fi

    mkdir -p "$WORKTREE_BASE"
    git worktree add "$worktree_path" -b "$branch_name"
    echo "✅ Created worktree: $worktree_path"
}

# Function to launch Claude in worktree
launch_claude() {
    local worktree_path=$1
    local session_name=$2

    if [ ! -d "$worktree_path" ]; then
        echo "❌ Worktree doesn't exist: $worktree_path"
        return 1
    fi

    echo "🚀 Launching Claude Code in: $worktree_path"
    osascript -e "tell application \"Terminal\" to do script \"cd '$worktree_path' && claude\""
}

# Function to list worktrees
list_worktrees() {
    echo ""
    echo "📋 Current worktrees:"
    git worktree list
    echo ""
}

# Function to setup tmux layout
setup_tmux() {
    local session_name="harmonia-parallel"

    if tmux has-session -t "$session_name" 2>/dev/null; then
        echo "⚠️  tmux session '$session_name' already exists"
        read -p "Attach to existing session? (y/n): " attach
        if [ "$attach" = "y" ]; then
            tmux attach -t "$session_name"
            return 0
        fi
        return 1
    fi

    # Get list of worktrees
    mapfile -t worktrees < <(git worktree list --porcelain | grep "worktree " | cut -d' ' -f2)

    if [ ${#worktrees[@]} -lt 2 ]; then
        echo "❌ Need at least 2 worktrees to create tmux layout"
        echo "   Create worktrees first (option 2 in menu)"
        return 1
    fi

    # Create new tmux session
    tmux new-session -d -s "$session_name" -c "${worktrees[0]}"
    tmux send-keys -t "$session_name:0" "claude" C-m

    # Add panes for other worktrees
    for i in "${!worktrees[@]}"; do
        if [ $i -eq 0 ]; then continue; fi

        tmux split-window -t "$session_name" -h -c "${worktrees[$i]}"
        tmux send-keys -t "$session_name:0.$i" "claude" C-m
        tmux select-layout -t "$session_name" tiled
    done

    echo "✅ Created tmux session: $session_name"
    echo "   Attaching..."
    tmux attach -t "$session_name"
}

# Main menu
show_menu() {
    echo ""
    echo "What would you like to do?"
    echo ""
    echo "  1) Check GitHub authentication"
    echo "  2) Create a new worktree"
    echo "  3) List all worktrees"
    echo "  4) Launch Claude in worktree (new Terminal window)"
    echo "  5) Launch all worktrees in tmux (advanced)"
    echo "  6) Remove a worktree"
    echo "  7) View setup guide"
    echo "  8) Exit"
    echo ""
    read -p "Choose an option (1-8): " choice

    case $choice in
        1)
            check_github_auth
            ;;
        2)
            read -p "Enter branch name for new worktree: " branch_name
            create_worktree "$branch_name"
            ;;
        3)
            list_worktrees
            ;;
        4)
            list_worktrees
            read -p "Enter worktree path: " worktree_path
            read -p "Enter session name (optional): " session_name
            launch_claude "$worktree_path" "$session_name"
            ;;
        5)
            setup_tmux
            ;;
        6)
            list_worktrees
            read -p "Enter worktree path to remove: " worktree_path
            git worktree remove "$worktree_path"
            echo "✅ Removed worktree: $worktree_path"
            ;;
        7)
            if [ -f "$REPO_DIR/WORKTREE_SETUP_GUIDE.md" ]; then
                cat "$REPO_DIR/WORKTREE_SETUP_GUIDE.md"
            else
                echo "❌ Setup guide not found"
            fi
            ;;
        8)
            echo "👋 Goodbye!"
            exit 0
            ;;
        *)
            echo "❌ Invalid option"
            ;;
    esac
}

# Run initial check
check_github_auth || true

# Main loop
while true; do
    show_menu
done
