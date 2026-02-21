#!/bin/bash
# ============================================================
# Claude Code + Git Worktrees — Parallel Session Launcher
# ============================================================
# Usage:
#   ./worktree-setup.sh                  — interactive menu
#   ./worktree-setup.sh new <name>       — create worktree + open Claude
#   ./worktree-setup.sh list             — list active worktrees
#   ./worktree-setup.sh remove <name>    — clean up a worktree
#   ./worktree-setup.sh launch [name]    — open Claude in a worktree
# ============================================================

set -e

# ── CONFIG ──────────────────────────────────────────────────
REPO_URL="https://github.com/studiozo/claude.git"
MAIN_DIR="$HOME/claude-worktrees/main"
WORKTREE_ROOT="$HOME/claude-worktrees"
# ────────────────────────────────────────────────────────────

BOLD="\033[1m"
DIM="\033[2m"
GREEN="\033[32m"
CYAN="\033[36m"
YELLOW="\033[33m"
RED="\033[31m"
RESET="\033[0m"

print_header() {
    echo ""
    echo -e "${BOLD}${CYAN}╔════════════════════════════════════════════╗${RESET}"
    echo -e "${BOLD}${CYAN}║  Claude Code × Git Worktrees              ║${RESET}"
    echo -e "${BOLD}${CYAN}╚════════════════════════════════════════════╝${RESET}"
    echo ""
}

# ── INIT: Clone repo if not already present ─────────────────
init_repo() {
    if [ ! -d "$MAIN_DIR/.git" ]; then
        echo -e "${YELLOW}→ Cloning repo into $MAIN_DIR...${RESET}"
        mkdir -p "$WORKTREE_ROOT"
        git clone "$REPO_URL" "$MAIN_DIR"
        echo -e "${GREEN}✓ Repo cloned.${RESET}"
    else
        echo -e "${DIM}✓ Repo already exists at $MAIN_DIR${RESET}"
    fi
}

# ── NEW: Create a worktree + branch ─────────────────────────
cmd_new() {
    local name="$1"
    if [ -z "$name" ]; then
        echo -e "${YELLOW}Enter a name for this worktree (e.g. feature-auth, bugfix-api):${RESET}"
        read -r name
    fi

    if [ -z "$name" ]; then
        echo -e "${RED}✗ Name required.${RESET}"
        exit 1
    fi

    init_repo

    local wt_path="$WORKTREE_ROOT/$name"

    if [ -d "$wt_path" ]; then
        echo -e "${RED}✗ Worktree '$name' already exists at $wt_path${RESET}"
        echo -e "${DIM}  Use: ./worktree-setup.sh launch $name${RESET}"
        exit 1
    fi

    cd "$MAIN_DIR"

    # Create new branch + worktree
    echo -e "${YELLOW}→ Creating worktree '$name'...${RESET}"
    git worktree add "$wt_path" -b "$name" 2>/dev/null || \
        git worktree add "$wt_path" "$name"

    echo -e "${GREEN}✓ Worktree created at: $wt_path${RESET}"
    echo ""

    # Install deps if package.json exists
    if [ -f "$wt_path/package.json" ]; then
        echo -e "${YELLOW}→ Installing dependencies...${RESET}"
        cd "$wt_path" && npm install 2>/dev/null && echo -e "${GREEN}✓ Deps installed.${RESET}"
    fi

    # Offer to launch Claude
    echo ""
    echo -e "${BOLD}Ready to launch Claude Code in this worktree?${RESET}"
    echo -e "${DIM}  cd $wt_path && claude${RESET}"
    echo ""
    read -r -p "Launch now? [Y/n] " yn
    case "$yn" in
        [Nn]*) echo -e "${DIM}Skipped. Run 'claude' in $wt_path when ready.${RESET}" ;;
        *)     cd "$wt_path" && claude ;;
    esac
}

# ── LIST: Show all active worktrees ─────────────────────────
cmd_list() {
    init_repo
    echo -e "${BOLD}Active worktrees:${RESET}"
    echo ""
    cd "$MAIN_DIR"
    git worktree list | while read -r line; do
        echo -e "  ${CYAN}•${RESET} $line"
    done
    echo ""
}

# ── REMOVE: Clean up a worktree ─────────────────────────────
cmd_remove() {
    local name="$1"
    if [ -z "$name" ]; then
        echo -e "${YELLOW}Which worktree to remove?${RESET}"
        cmd_list
        read -r -p "Name: " name
    fi

    local wt_path="$WORKTREE_ROOT/$name"

    if [ ! -d "$wt_path" ]; then
        echo -e "${RED}✗ No worktree found at $wt_path${RESET}"
        exit 1
    fi

    cd "$MAIN_DIR"
    echo -e "${YELLOW}→ Removing worktree '$name'...${RESET}"
    git worktree remove "$wt_path" --force
    # Also delete the branch
    git branch -D "$name" 2>/dev/null && echo -e "${DIM}  Branch '$name' deleted.${RESET}"
    echo -e "${GREEN}✓ Worktree removed.${RESET}"
}

# ── LAUNCH: Open Claude in an existing worktree ─────────────
cmd_launch() {
    local name="$1"
    if [ -z "$name" ]; then
        echo -e "${YELLOW}Which worktree to launch Claude in?${RESET}"
        cmd_list
        read -r -p "Name: " name
    fi

    local wt_path="$WORKTREE_ROOT/$name"

    if [ ! -d "$wt_path" ]; then
        echo -e "${RED}✗ No worktree at $wt_path${RESET}"
        exit 1
    fi

    echo -e "${GREEN}→ Launching Claude Code in $wt_path${RESET}"
    cd "$wt_path" && claude
}

# ── PARALLEL: Launch multiple worktrees in split terminals ───
cmd_parallel() {
    init_repo
    cd "$MAIN_DIR"

    local worktrees
    worktrees=$(git worktree list --porcelain | grep "^worktree " | sed 's/^worktree //' | grep -v "$MAIN_DIR")

    if [ -z "$worktrees" ]; then
        echo -e "${RED}✗ No worktrees found. Create some first with: ./worktree-setup.sh new <name>${RESET}"
        exit 1
    fi

    echo -e "${BOLD}Launching Claude Code in all worktrees...${RESET}"
    echo ""

    # Try tmux first, fall back to background processes
    if command -v tmux &>/dev/null; then
        local session="claude-parallel"
        tmux kill-session -t "$session" 2>/dev/null || true
        local first=true

        while IFS= read -r wt; do
            local name
            name=$(basename "$wt")
            if $first; then
                tmux new-session -d -s "$session" -n "$name" "cd '$wt' && claude"
                first=false
            else
                tmux new-window -t "$session" -n "$name" "cd '$wt' && claude"
            fi
            echo -e "  ${CYAN}•${RESET} $name → $wt"
        done <<< "$worktrees"

        echo ""
        echo -e "${GREEN}✓ All sessions launched in tmux.${RESET}"
        echo -e "${DIM}  Attach with: tmux attach -t $session${RESET}"
        echo -e "${DIM}  Switch windows: Ctrl+B then number (0, 1, 2...)${RESET}"
        tmux attach -t "$session"
    else
        echo -e "${YELLOW}tmux not found. Install it for the best parallel experience:${RESET}"
        echo -e "${DIM}  brew install tmux${RESET}"
        echo ""
        echo -e "Opening each worktree in a new terminal tab..."

        while IFS= read -r wt; do
            local name
            name=$(basename "$wt")
            if [[ "$OSTYPE" == "darwin"* ]]; then
                osascript -e "tell application \"Terminal\" to do script \"cd '$wt' && claude\""
            else
                echo -e "  ${DIM}cd $wt && claude${RESET}"
            fi
            echo -e "  ${CYAN}•${RESET} $name"
        done <<< "$worktrees"
    fi
}

# ── INTERACTIVE MENU ────────────────────────────────────────
cmd_menu() {
    print_header
    echo -e "  ${BOLD}1)${RESET} Create new worktree"
    echo -e "  ${BOLD}2)${RESET} List worktrees"
    echo -e "  ${BOLD}3)${RESET} Launch Claude in a worktree"
    echo -e "  ${BOLD}4)${RESET} Launch Claude in ALL worktrees (parallel)"
    echo -e "  ${BOLD}5)${RESET} Remove a worktree"
    echo -e "  ${BOLD}q)${RESET} Quit"
    echo ""
    read -r -p "Choose: " choice

    case "$choice" in
        1) cmd_new ;;
        2) cmd_list ;;
        3) cmd_launch ;;
        4) cmd_parallel ;;
        5) cmd_remove ;;
        q|Q) exit 0 ;;
        *) echo -e "${RED}Invalid choice.${RESET}" ;;
    esac
}

# ── MAIN ────────────────────────────────────────────────────
case "${1:-}" in
    new)      cmd_new "$2" ;;
    list)     cmd_list ;;
    remove)   cmd_remove "$2" ;;
    launch)   cmd_launch "$2" ;;
    parallel) cmd_parallel ;;
    *)        cmd_menu ;;
esac
