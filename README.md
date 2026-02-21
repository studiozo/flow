# FLØW

Quick-sync repo between M4Pro and Mac Mini. Drop files, push, pull on the other side.

---

## Setup (first time on a new machine)

```bash
gh repo clone studiozo/flow ~/00_ZØ_CØDE/flow
```

## Push (send files)

```bash
cd ~/00_ZØ_CØDE/flow
git add . && git commit -m "description" && git push
```

## Pull (receive files)

```bash
cd ~/00_ZØ_CØDE/flow
git pull
```

---

## Claude Code Auto-Accept Setup (new machine)

The config files are in `.claude-config/`. To install on a new machine:

```bash
mkdir -p ~/.claude
cp ~/00_ZØ_CØDE/flow/.claude-config/settings.json ~/.claude/settings.json
cp ~/00_ZØ_CØDE/flow/.claude-config/keybindings.json ~/.claude/keybindings.json
```

This gives you:
- **Auto-accept** all Read, Write, Edit, and Bash commands (no prompts)
- **Safety net** blocking `rm -rf`, `rm -r`, `sudo`, `chmod`, `chown`
- **Custom keybindings** (alt+enter to submit, ctrl+k chords for todos/transcript)

---

## Rules

- This is a **transit folder**, not an archive. Move things out when done.
- Keep it lean. Don't let it bloat.
- Nothing sensitive (keys, tokens, credentials) goes here.
- `.gitignore` anything heavy that shouldn't sync (raw video, massive datasets).
