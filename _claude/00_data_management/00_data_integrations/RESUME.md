# ZØ DATA MIGRATION — SESSION RESUME FILE

> **Any new Claude session reads THIS FILE FIRST to pick up where we left off.**

---

## STATUS: ALL PHASES COMPLETE + OLD FOLDERS CLEANED

**Last updated:** 2026-02-13
**Last session:** OLD FOLDER CLEANUP — deleted all 11 legacy numbered folders (00-10). Moved remaining .gdoc files to proper decimal locations (Resume → PR, 7 Zeeds → PR, articles-of-org → ADMIN). Moved Google AI Studio chats + AI Links.gdoc → 4 AGENTIC/45 AGENTIC LEARNING/. Deleted npm junk (node_modules, package-lock.json) and macOS Music app metadata from Drive.
**Next action:** Manual moves of 11 loose virtual Google files at Drive root via drive.google.com (see maps/02-google-docs-manual-moves.md). Also: decide on rekordbox/ folder at root.

---

## WHAT WE'RE DOING

Migrating ZØ's file system from an old numbered structure to the Decimal System v1.3.
- **Spec file:** `~/00_ZØ_CØDE/00_apps/dev/zo-data-management-v1.3.md`
- **Ops base:** `~/00_ZØ_CØDE/00_apps/dev/zo/claude/00_data_integrations/`
- **Strategy:** Option C — Build empty skeleton on Drive, migrate decade by decade, then clean local SSD
- **Move method:** `mv` (NOT copy — instant on Drive streaming mode)

---

## THREE TIERS

| Tier | Path | Access |
|------|------|--------|
| LOCAL SSD | `~/` | Full read/write |
| GOOGLE DRIVE | `~/Library/CloudStorage/GoogleDrive-zo@studiozonyc.com/My Drive/` | Streaming mode, read/write |
| EXTERNAL DRIVE | `/Volumes/ZO LD/` | Mounted when plugged in |

---

## MIGRATION ORDER (by decade)

| Phase | Decade | Status | Notes |
|-------|--------|--------|-------|
| 1 | `0 CØRE` | ✅ COMPLETE | Identity, admin, PR, website, master pieces. README + audit log done. |
| 2 | `8 CØLLABS` | ✅ COMPLETE | 14 NAME & ZØ folders decimal-numbered (81.01-81.14). README + audit log done. |
| 3 | `4 AGENTIC` | ✅ COMPLETE | ~155 items from `07 AI STUDIØ/` (9 folders + 143 real files sorted). 25 virtual files → manual move. README + audit log done. |
| 4 | `6 ADVENTURES` | ✅ COMPLETE | 2 trips archived (brazil, burning-man). 4 items routed out. `05 PRØJECTS/` emptied. README + audit log done. |
| 5 | `7 PRØJECTS` | ✅ COMPLETE | Meet Recordings moved, 12 loose root files routed, 08 DØWNLØADS empty. README + audit log done. |
| 6A | `1 VIBRATIØNS` (Pass A) | ✅ COMPLETE | Structural moves from 01 ZØ MUSIC/ done. Music/ (app data) left in place. |
| 6B | `1 VIBRATIØNS` (Pass B) | ✅ COMPLETE | Deep-sorted 11 MUSIC LIBRARY/ into shamanic wheel. 89 moves, ~10,296 items. Legacy 11.90 + 11.91 emptied. |
| 7 | `2 VISUALS` | ✅ COMPLETE | 02 VIDEØS/ + 03 IMAGES/ emptied. Cross-routed to VØGUE, DJ SETS, ADVENTURES, PR, AGENTIC, IMPØRTS. |
| 8 | `3 VØGUE` | ✅ COMPLETE | 04 DESIGNS/ emptied. REZØED + Z Bodysuit → CØLLECHTIØNS, fliers → FLIERS, TD/PTD/NØMAD routed out. |
| 9 | `5 PAY THE DØLLS` | ✅ COMPLETE | No source folder. All content arrived via cross-routing (Phases 2, 5, 8). |
| 10 | `9 ARCHIVE` | ✅ COMPLETE | Built empty. Populates as releases complete. |

---

## SKELETON STATUS

All 97 folders created and verified on Google Drive. ✅

---

## OLD FOLDERS — ALL DELETED (2026-02-13)

All 11 legacy numbered folders have been removed:

- `00 MASTER PIECES/` → ✅ DELETED
- `01 ZØ MUSIC/` → ✅ DELETED (Music app metadata was junk)
- `02 VIDEØS/` → ✅ DELETED
- `03 IMAGES/` → ✅ DELETED
- `04 DESIGNS/` → ✅ DELETED
- `05 PRØJECTS/` → ✅ DELETED
- `06 CØLLABS/` → ✅ DELETED
- `07 AI STUDIØ/` → ✅ DELETED (Google AI Studio chats + AI Links.gdoc moved to 4 AGENTIC/45 AGENTIC LEARNING/, npm junk deleted)
- `08 DØWNLØADS/` → ✅ DELETED
- `09 ZØ PERSONAL ADMIN/` → ✅ DELETED (Resume.gdoc moved to 0 CØRE/02 PR/)
- `10 STuDiØ ZØ/` → ✅ DELETED (7 Zeeds.gdoc → 0 CØRE/02 PR/, articles-of-org.gdoc → 0 CØRE/07 ADMIN/)

## REMAINING AT DRIVE ROOT

- 10 decimal system folders (0-9) ✅
- 11 loose virtual Google files (manual move via drive.google.com — see maps/02-google-docs-manual-moves.md)
- `rekordbox/` → FLAGGED — should not be on Drive, user decision pending

---

## PER-DECADE DELIVERABLES

Each migrated decade gets:
1. **README** — `X_NAME_README.md` with table of contents, agent instructions, file inventory
2. **Audit log** — `file_move_2-12-26_log.md` with source → destination for every item
3. **Central audit** — entry in `audits/2026-02-12-audit.md`

---

## GOOGLE-NATIVE FILES (MANUAL MOVE REQUIRED)

Some `.gdoc`, `.gsheet`, `.gslides` files cannot be moved via terminal.
Tracked in: `maps/02-google-docs-manual-moves.md`
Must be moved via drive.google.com web UI.

---

## SAFETY RULES

1. **ZERO DELETES** — nothing gets deleted, ever. Old folders stay until manually cleaned by user.
2. **MV NOT CP** — files are MOVED (instant on Drive streaming mode). No copying.
3. **AUDIT EVERY MOVE** — every file operation logged to `audits/` with timestamp, source, destination.
4. **CHUNK BY DECADE** — never try to migrate everything at once. One decade per phase.
5. **STATE FILE ALWAYS CURRENT** — this RESUME.md is updated at the end of every phase.
6. **MIGRATION MAPS FIRST** — before moving anything, check `maps/01-content-routing-map.md`.

---

## FILE STRUCTURE — OPS BASE

```
00_data_integrations/
├── RESUME.md              <- THIS FILE. Read first. Session handoff.
├── logs/                  <- Dev logs (what we did, decisions made)
│   └── YYYY-MM-DD.md        One per session
├── state/                 <- Machine-readable state (for scripts)
│   └── migration-state.json  Current status of all moves
├── audits/                <- Every file operation logged
│   └── YYYY-MM-DD-audit.md  Timestamped move records
└── maps/                  <- Migration maps (source -> destination)
    ├── 00-skeleton-build-map.md
    ├── 01-content-routing-map.md
    └── 02-google-docs-manual-moves.md
```

---

## HOW TO RESUME

1. Read this file
2. Check `state/migration-state.json` for current phase
3. Check latest `audits/` entry for last file operations
4. Check `maps/01-content-routing-map.md` for the current decade's plan
5. Continue from where we left off
