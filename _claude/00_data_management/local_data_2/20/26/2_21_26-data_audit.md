# STUDIO ZØ — LOCAL DISK AUDIT
### 2/21/26 — MacBook Pro (M4) — 926 GB SSD

---

## CLEANUP RESULTS — COMPLETED 2/21/26

| | Before | After |
|---|---|---|
| **Free Space** | **18 GB** | **123 GB** |
| **Capacity Used** | 48% | 12% |
| **Total Recovered** | — | **~105 GB** |

### What Was Cleared

| Item | Size Recovered | Method |
|------|---------------|--------|
| Ableton 12.2.6 Crash Reports (Preferences) | 32 GB | CLI — `find -delete` |
| Ableton 12.2.6 Crash Reports (App Support) | 3.7 GB | CLI — `find -delete` |
| Claude Desktop vm_bundles | 9.8 GB | CLI — `find -delete` (auto-regenerates) |
| iMessage Attachments | ~57 GB | macOS Storage Settings > Messages |
| Stale Google Drive orphan (2-13-26 re-sync) | 37 GB | CLI — `find -delete` (confirmed files exist elsewhere) |
| .gemini (browser profile + runtime + npm cache) | 9.6 GB | CLI — `find -delete` |
| .langflow (runtime data) | 2 GB | CLI — `find -delete` |
| Spotify cache | 4.7 GB | CLI — `find -delete` |
| Telegram cache | 1.2 GB | CLI — `find -delete` |
| All .ShipIt update caches (VS Code, Claude, Cursor, Notion, etc.) | ~3 GB | CLI — `find -delete` |
| npm cache | 1.8 GB | `npm cache clean --force` |
| pip cache | 202 MB | `pip cache purge` |
| Homebrew cache | 314 MB | `brew cleanup --prune=all` |
| pnpm store | pruned | `pnpm store prune` |

### Key Decisions

- **Stale Google Drive:** Contained 13 GB of DNG photos + MOV videos from Jan 2026 in `0 CØRE/08 IMPØRTS`. Verified with user that files exist elsewhere before deleting.
- **iMessage Attachments:** Cleared via macOS System Settings (NOT CLI) to keep Messages database in sync. Never delete `~/Library/Messages/Attachments/` via Finder or terminal.
- **Active Google Drive mount** (`GoogleDrive-zo@studiozonyc.com`): This is a **virtual/streamed filesystem** — files are fetched on demand, NOT stored locally. The `du` size is apparent size, not actual disk usage. Left untouched.

---

## PRE-CLEANUP SNAPSHOT (for reference)

### Disk Overview (Before)
| Metric | Value |
|--------|-------|
| Total Disk | 926 GB |
| Used (system-reported) | ~848 GB (48% capacity) |
| Available | ~18 GB FREE (CRITICAL) |

### Top-Level Home Directory Breakdown (Before)
| Folder | Size | Notes |
|--------|------|-------|
| **Library** | 256 GB | Caches, Messages, App Data, Cloud Storage |
| **Music** | 231 GB | Sample libraries, DAW projects, plugins |
| **Pictures** | 76 GB | Photos Library + Lightroom |
| **Desktop** | 61 GB | Music projects (Logic, Ableton) |
| **00_ZØ_CØDE** | 8.4 GB | Dev projects |
| **Movies** | 3.0 GB | — |
| **Applications** | 2.1 GB | User-installed apps |
| **Downloads** | 878 MB | Relatively clean |
| **Documents** | 12 MB | Barely used |
| **.gemini** | 9.6 GB | Gemini CLI + browser profile cache — **CLEARED** |
| **.cache** | 2.5 GB | General cache |
| **.langflow** | 2.0 GB | Langflow runtime data — **CLEARED** |
| **.npm** | 1.8 GB | npm cache — **CLEARED** |
| **.vscode** | 1.0 GB | VS Code extensions/data |
| **.nvm** | 662 MB | Node version manager |
| **.local** | 583 MB | Local binaries/data |
| **.antigravity** | 514 MB | Google Antigravity |
| **.claude** | 471 MB | Claude Code config/memory |
| **.cursor** | 225 MB | Cursor editor |

---

## LIBRARY DEEP DIVE (256 GB before cleanup)

### CloudStorage — 75 GB (before)
| Path | Size | Status |
|------|------|--------|
| GoogleDrive-zo@studiozonyc.com | 39 GB (apparent) | Active — virtual/streamed, not local disk |
| GoogleDrive-zo@studiozonyc.com (2-13-26 02:15) | 37 GB | **DELETED** — orphaned local files from Drive re-sync |

> **FINDING:** The stale copy was real local files (not virtual). Created when Google Drive re-authenticated on 2/13/26. The active mount is a FUSE virtual filesystem — files stream from cloud on demand.

### Messages — 61 GB (before)
| Path | Size | Status |
|------|------|--------|
| **Attachments** | **57 GB → 8 KB** | **CLEARED** via macOS Storage Settings |
| Caches | 2.6 GB | Untouched |
| Sync | 218 MB | Untouched |
| NickNameCache | 68 MB | Untouched |

### Application Support — 40 GB (before)
| App | Size | Status |
|-----|------|--------|
| **Claude (Desktop App)** | **11 GB** | **vm_bundles CLEARED (9.8 GB)** — auto-regenerates |
| Google (Chrome + Drive) | 7.9 GB | Untouched (4 GB is Chrome on-device AI model — can disable at `chrome://settings/ai`) |
| **Ableton** | **6.2 GB** | **Crash reports CLEARED (3.7 GB)** |
| FileProvider | 4.1 GB | Untouched — system-managed Drive sync |
| Notion | 2.4 GB | Untouched — offline cache, could clear |
| Sidify Deezer | 2.3 GB | Untouched — clearable if not using |
| VS Code | 1.4 GB | Untouched |
| Antigravity | 1.1 GB | Untouched — clearable if not using |
| Adobe | 929 MB | Untouched |
| Spotify | 645 MB | Untouched |

### Preferences — 32 GB (before)
| App | Size | Status |
|-----|------|--------|
| **Ableton Live 12.2.6** | **32 GB → 192 MB** | **CRASH DUMPS CLEARED** |
| Ableton Live 12.2.7 | 12 MB | Active version, untouched |

### Caches — 18 GB (before)
| Cache | Size | Status |
|-------|------|--------|
| **Spotify** | **4.7 GB** | **CLEARED** |
| Google (Chrome) | 2.1 GB | Untouched |
| CloudKit | 1.9 GB | Untouched |
| **Telegram** | **1.2 GB** | **CLEARED** |
| Comet | 947 MB | Untouched |
| Adobe Camera Raw | 870 MB | Untouched |
| Adobe | 782 MB | Untouched |
| **All .ShipIt caches** | **~3 GB** | **CLEARED** (VS Code, Claude, Cursor, Notion, Antigravity, UA Connect) |
| Playwright | 520 MB | Untouched |
| SiriTTS | 445 MB | Untouched |
| **Homebrew** | **250 MB** | **CLEARED** |
| **pnpm** | **207 MB** | **PRUNED** |
| **pip** | **194 MB** | **CLEARED** |

### Containers — 12 GB
| Container | Size | Notes |
|-----------|------|-------|
| MobileSMS (iMessage) | 7.1 GB | Additional iMessage sandbox data |
| Docker | 1.6 GB | Docker Desktop container |
| Canva | 1.6 GB | Canva editor cache |
| Safari | 769 MB | Browser data |

### Other Library Items
| Path | Size | Notes |
|------|------|-------|
| Metadata (Spotlight) | 4.3 GB | Search index — do not touch |
| Pioneer (rekordbox) | 3.5 GB | DJ library data |
| pnpm store | 1.3 GB | Package store |
| Biome | 758 MB | Linter data |
| Logs | 571 MB | App logs (safe to clear periodically) |
| Photos | 541 MB | Thumbnail/face data |

---

## MUSIC (231 GB — untouched)

### iZØ.IØ — 129 GB (Main Production Library)
| Folder | Size |
|--------|------|
| **SAMPLES** | **86 GB** |
| TEMPLATE_PACKS | 28 GB |
| VST_PRESETS | 11 GB |
| IMPORTS | 4.3 GB |

### z-pack — 46 GB
| Folder | Size |
|--------|------|
| SAMPLES | 34 GB |
| ZØxTPS | 7.6 GB |
| MIDI | 3.0 GB |

### Other Music
| Folder | Size |
|--------|------|
| 04 MELØDIC | 20 GB |
| 09 PLUGINS | 11 GB |
| 02 AFRØ : TRIBAL | 11 GB |
| Apple Music Library | 5.3 GB |
| Audio Music Apps | 4.1 GB |

> **OPEN QUESTION:** Is there overlap between iZØ.IØ/SAMPLES (86 GB) and z-pack/SAMPLES (34 GB)? 120 GB in samples across two locations may have duplicates. A dedup scan could save 10-30 GB.

---

## PICTURES (76 GB — untouched)

| Item | Size |
|------|------|
| Photos Library.photoslibrary | 50 GB |
| Lightroom Library.lrlibrary | 15 GB |
| Lightroom (catalog/previews) | 721 MB |

---

## DESKTOP (61 GB — untouched)

| Folder | Size |
|--------|------|
| 01 ZØ LØGIC (Logic projects) | 37 GB |
| 00 ZØ ABLETØN (Ableton projects) | 20 GB |
| NAU KIKI ZO Audio Files | 1.4 GB |
| 00 MASTER PIECES | 1.7 GB |

---

## ZØNE FILING SYSTEM — IMPLEMENTED 2/21/26

The Workbench zone architecture from `zo-data-management-v1_5.md` has been built on the local SSD.

### Zone Structure Created
| Zone | Path | Purpose |
|------|------|---------|
| **MUSIC ZØNE** | `~/Music/` | Production samples, DAW projects, plugins (~250 GB) |
| **IMAGE ZØNE** | `~/Image/` | Working images + exports (new) |
| **VIDEØ ZØNE** | `~/Video/` | Video projects, renders, TouchDesigner, exports |
| **CØDE ZØNE** | `~/00_ZØ_CØDE/` + `~/01_ZØ_AGENTS/` | Dev projects + agent tooling |
| **RELEASES** | `~/Releases/` | Active assembly → ships to Lake (new) |
| **PRØJECTS** | `~/Projects/` | Open-ended work (new) |
| **SCRATCH** | `~/Scratch/` | Disposable workspace (new) |

### Items Routed
| From | To |
|------|----|
| `~/prometheus-render/` | `~/00_ZØ_CØDE/prometheus-render/` |
| `~/Code/prometheus/` | `~/00_ZØ_CØDE/prometheus/` |
| `~/DaVinci Resolve Media/` | `~/Video/working/DaVinci Resolve Media/` |
| `~/Movies/*` (OBS, CapCut, TV, .mov) | `~/Video/working/` |

### Legacy Clutter Removed
| Item | Status |
|------|--------|
| `~/06 ZØ TPS/` | Deleted (empty) |
| `~/2.1.1 Render Cache/` | Deleted (empty) |
| `~/Creative Cloud Files/` | Deleted (empty) |
| `~/Creative Cloud Files  zo@...` | Deleted (empty) |
| `~/Templates/` | Deleted (empty) |
| `~/Torrents/` | Deleted (user confirmed) |
| `~/Code/` | Deleted (contents moved to Code zone) |
| `~/Movies/` | Emptied (macOS ACL prevents folder deletion) |
| `~/Sites/` | Kept (macOS ACL prevents deletion — empty, harmless) |

### Zone Markers Deployed
`_ZØNE.md` files placed in all 8 zone folders.

---

## STILL ON THE TABLE — FUTURE CLEANUP OPPORTUNITIES

### Low-Hanging Fruit (no risk)
| Target | Size | How |
|--------|------|-----|
| Chrome on-device AI model | 4 GB | Disable at `chrome://settings/ai` |
| Notion offline cache | 2.4 GB | Delete `~/Library/Application Support/Notion/Partitions/` — re-syncs |
| Sidify Deezer (if not using) | 2.3 GB | Delete `~/Library/Application Support/Sidify Deezer Music Converter/` |
| Antigravity (if not using) | 1.1 GB | Delete `~/Library/Application Support/Antigravity/` |
| Comet browser (if not using) | 473 MB | Delete `~/Library/Application Support/Comet/` |
| Wineskin (if not using) | 433 MB | Delete `~/Library/Application Support/Wineskin/` |
| WebCatalog (if not using) | 434 MB | Delete `~/Library/Application Support/WebCatalog/` |
| All Logs | 571 MB | Delete `~/Library/Logs/` contents |

### Needs Review (your creative data)
| Target | Size | Question |
|--------|------|----------|
| Sample library dedup (iZØ.IØ vs z-pack) | 120 GB total | Potential 10-30 GB in duplicates |
| Lightroom Library | 15 GB | Active or legacy workflow? |
| Desktop music projects | 59 GB | Could archive to external/cloud? |
| Music/09 PLUGINS | 11 GB | Installed plugins or just installers? |

### Do Not Touch
| Target | Reason |
|--------|--------|
| Photos Library (50 GB) | Your photo library |
| Active music production folders | Creative work |
| Active Google Drive mount | Virtual/streamed — not eating disk |
| Spotlight index (4.3 GB) | System search needs it |
| Keychain, system Preferences | System configs |

---

## KEY LEARNINGS

1. **iMessage attachments are local copies** — manage via `System Settings > General > Storage > Messages`, never via CLI/Finder
2. **Ableton crash dumps can grow to 30+ GB silently** — check `~/Library/Preferences/Ableton/` and `~/Library/Application Support/Ableton/Live Reports/` periodically
3. **Google Drive stale mounts persist after re-sync** — check `~/Library/CloudStorage/` for parenthetical-dated duplicates
4. **Claude Desktop vm_bundles auto-regenerate** — safe to clear anytime for ~10 GB
5. **All .ShipIt folders are dead weight** — safe to purge anytime
6. **Active Google Drive is virtual (streamed)** — `du` shows apparent size, not local disk usage
7. **Full taxonomy of what each folder is:** see `01_data_index_taxonomy/data_index_taxonomy.md`

---

*Audit generated 2/21/26 — cleanup executed same day.*
*18 GB → 123 GB free. 105 GB recovered.*
