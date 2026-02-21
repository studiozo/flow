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

## Rules

- This is a **transit folder**, not an archive. Move things out when done.
- Keep it lean. Don't let it bloat.
- Nothing sensitive (keys, tokens, credentials) goes here.
- `.gitignore` anything heavy that shouldn't sync (raw video, massive datasets).
