# DATA INDEX TAXONOMY — Studio ZØ Workbench
### What each folder/item actually is, in plain language
### Studio ZØ — MacBook Pro M4 — Updated 2/21/26

---

## ~/  — THE WØRKBENCH (M4Pro 1TB SSD)

The home directory is organized into zones. Each zone has a `_ZØNE.md` marker file.

### Creative Zones
| Zone | Path | What It Is |
|------|------|-----------|
| **MUSIC ZØNE** | `~/Music/` | Production samples (iZØ.IØ, z-pack), DAW projects, plugins, Apple Music. ~250 GB. The heaviest zone. |
| **IMAGE ZØNE** | `~/Image/` | `working/` for active image projects, `exports/` for final renders. |
| **VIDEØ ZØNE** | `~/Video/` | `working/` (DaVinci, OBS, CapCut), `renders/`, `touchdesigner/` (TD projects, theory, templates, exports), `exports/`. |
| **PHOTOS** | `~/Pictures/` | Apple Photos Library (50 GB) + Lightroom catalog (15 GB). Left in place to avoid breaking catalog paths. |

### Code Zones
| Zone | Path | What It Is |
|------|------|-----------|
| **CØDE ZØNE** | `~/00_ZØ_CØDE/` | Main development projects, scaffolds, repos. Includes `_claude/` (Claude Code memory/data), `prometheus/`, `prometheus-render/`. |
| **AGENTS ZØNE** | `~/01_ZØ_AGENTS/` | AI agent projects, MCP servers, automation tooling. Paired with Code zone. |

### Work Zones
| Zone | Path | What It Is |
|------|------|-----------|
| **RELEASES** | `~/Releases/` | Active assembly for work being finalized. Ships to Lake (external archive) when done. |
| **PRØJECTS** | `~/Projects/` | Open-ended work without release deadlines. Research, explorations, collaborations. |
| **SCRATCH** | `~/Scratch/` | Disposable workspace. Quick tests, one-off experiments. Delete freely. |

### System & Intake
| Folder | What It Is |
|--------|-----------|
| `~/Desktop/` | **Landing Pad** — sort weekly. Currently holds Logic + Ableton projects (~61 GB). |
| `~/Downloads/` | **Intake** — process regularly. |
| `~/Documents/` | iCloud synced. Minimal use (12 MB). |
| `~/Applications/` | User-installed apps. |
| `~/Public/` | macOS default (empty). |
| `~/Movies/` | macOS default (emptied, ACL prevents deletion). |
| `~/Sites/` | macOS default (empty, ACL prevents deletion). |
| `~/Google Drive/` | Virtual/streamed cloud mount — not local storage. |
| `~/Library/` | Hidden system folder — see breakdown below. |
| `~/.*` | Hidden config folders — see dot-folders section below. |

---

## ~/Library/ — The Hidden Engine Room

macOS hides this folder by default. It stores all app data, caches, preferences, and system support files. **This is NOT your personal files** — it's where apps keep their stuff.

---

### ~/Library/Application Support/
**What:** Per-app data storage. Each app gets its own subfolder for databases, configs, downloaded models, and working files. This is the "junk drawer" of macOS — everything from browser profiles to DAW libraries.

| Subfolder | What It Actually Is |
|-----------|-------------------|
| **Claude/** | Claude Desktop app data |
| ↳ `vm_bundles/` | **Virtual Machine images.** When Claude Desktop runs code or uses "computer use," it boots a sandboxed mini-Linux VM so it can't touch your real system. This is the downloaded VM disk image (~8 GB) + a pre-warmed snapshot (~2 GB) for fast boot. **100% safe to delete** — re-downloads automatically next time you use agent features. Think of it like Spotify's offline cache, but for a virtual machine. |
| ↳ `Cache/` | Electron app cache (web content, rendered pages) |
| ↳ `Claude Extensions/` | MCP server extensions and tool bundles |
| ↳ `claude-code-vm/` | Claude Code's own lighter-weight VM sandbox |
| ↳ `local-agent-mode-sessions/` | Saved agent session transcripts |
| ↳ `Extensions Update Cache/` | Staged extension updates waiting to install |
| ↳ `Code Cache/` | V8 JavaScript engine compiled code cache |
| **Google/** | All Google app data combined |
| ↳ `Chrome/` | Chrome browser — profiles, history, bookmarks, extensions |
| ↳ `Chrome/OptGuideOnDeviceModel/` | **On-device AI model (4 GB).** Google downloads this for "smart" features (tab grouping, summarization). You can disable it at `chrome://settings/ai` and reclaim 4 GB. It re-downloads if re-enabled. |
| ↳ `Chrome/Profile 1-5/` | Each Chrome profile = separate bookmarks, history, extensions, cookies. Multiple profiles = multiple people or work/personal separation. |
| ↳ `DriveFS/` | Google Drive File Stream metadata and file cache |
| ↳ `GoogleUpdater/` | Staged update files for all Google apps. Safe to clear. |
| **Ableton/** | Ableton Live DAW data |
| ↳ `Live Reports/` | **Crash reports and usage telemetry.** Ableton stores crash dumps (can be HUGE — 3+ GB) as both zipped archives and uncompressed folders. Safe to delete — these are just diagnostic data for Ableton's developers. |
| ↳ `Live Database/` | Ableton's internal content browser database (indexes your packs, samples, plugins). Rebuilds on scan if deleted, but slow. |
| ↳ `Live 12.x.x/` | Version-specific runtime data (audio analysis, warp markers, etc.) |
| **FileProvider/** | macOS system — manages cloud file sync providers |
| ↳ `(UUID folders)` | Each cloud provider (Google Drive, iCloud) gets a UUID. Contains `wharf/` (file sync staging area) and `database/` (sync state tracking). System-managed — don't manually delete. |
| **Notion/** | |
| ↳ `Partitions/` | **Offline database cache.** Notion stores a local copy of your workspace for offline access. Safe to clear — re-syncs from cloud on next launch. |
| **Sidify Deezer Music Converter/** | Music downloading/converting tool |
| ↳ `Cache/` | Converted music file cache |
| ↳ `yt-dlp/` | Bundled YouTube/audio downloader binary + cache |
| ↳ `Partitions/` | Electron app web partitions (login sessions, cookies) |
| **Antigravity/** | Google's Chromium-based internal browser tool. If you're not using it, the whole folder is deletable. |
| **Comet/** | Chromium-based browser app. `Default/` = browser profile data. |
| **WebCatalog/** | Tool that wraps websites into standalone desktop apps. `photon/` is its Chromium engine. |
| **Wineskin/** | **Windows compatibility layer.** Lets you run `.exe` Windows apps on macOS. `Wrapper/` = the Wine runtime, `Engines/` = Wine engine versions. Keep if running any Windows-only plugins. |
| **Hit'n'Mix/** | Audio separation/remix plugin shared data. |
| **Neutone/** | **AI audio plugin.** `NeutoneFX/` stores downloaded neural network models for audio processing. |
| **Pioneer/** | rekordbox DJ software library and analysis data. |
| **obs-studio/** | OBS streaming/recording app settings and scenes. |

---

### ~/Library/Caches/
**What:** Temporary files apps create to speed things up. **ALL caches are safe to delete** — apps rebuild them. The only cost is temporary slowness while they regenerate.

| Cache | What It Actually Is |
|-------|-------------------|
| `com.spotify.client/` | **Spotify streaming cache.** Pre-buffered songs and offline content. Can be 5+ GB. Rebuilds as you stream. |
| `Google/` | Chrome browser cache (images, scripts, pages). |
| `CloudKit/` | **iCloud sync engine cache.** macOS uses this to stage iCloud data transfers. System-managed. |
| `ru.keepcoder.Telegram/` | **Telegram media cache.** Every photo/video/voice message you view gets cached locally. Media re-downloads on demand from Telegram servers. |
| `*.ShipIt/` | **App update staging folders.** When apps like VS Code, Claude, Cursor, Notion check for updates, they download the new version here before installing. After the update installs, these are dead weight. **Always safe to delete.** |
| `com.uaudio.ua-connect.update/` | Universal Audio interface driver/firmware update cache. |
| `Adobe Camera Raw 2/` | Preview thumbnails and processed previews for RAW photo files. Rebuilds when you open photos in Lightroom/Photoshop. |
| `ms-playwright/` | **Playwright browser testing binaries.** Full copies of Chromium/Firefox/WebKit for automated testing. If not doing web dev testing, safe to remove. |
| `SiriTTS/` | Siri text-to-speech voice model cache. System re-downloads if needed. |
| `Homebrew/` | Downloaded package archives. `brew cleanup` clears this. |
| `pnpm/` | pnpm package manager content-addressable store cache. |
| `pip/` | Python package download cache. `pip cache purge` clears this. |

---

### ~/Library/Messages/
**What:** iMessage/SMS data stored locally on your Mac.

| Subfolder | What It Actually Is |
|-----------|-------------------|
| **Attachments/** | **Every photo, video, audio clip, PDF, and file ever sent or received via iMessage.** Stored in hash-bucketed subfolders (`cc/`, `de/`, etc.). These are LOCAL copies. If "Messages in iCloud" is enabled, they also exist in iCloud and can be offloaded. **Do NOT delete via Finder** — use `System Settings > General > Storage > Messages` to manage, so the Messages database stays in sync. |
| `Caches/` | Search index and message rendering cache. |
| `Sync/` | iCloud Messages sync state data. |
| `NickNameCache/` | Contact avatars/Memoji cached for message display. |

---

### ~/Library/CloudStorage/
**What:** Mount points for cloud storage services. These folders are "virtual" — they show files synced from the cloud.

| Subfolder | What It Actually Is |
|-----------|-------------------|
| `GoogleDrive-{email}/` | Your active Google Drive sync. Files here are mirrored to/from Google's servers. |
| `GoogleDrive-{email} (date)/` | **Stale duplicate.** Created when Google Drive re-syncs or re-authenticates. The parenthetical date = when the old mount was disconnected. Usually safe to remove after verifying the active mount has all your files. |

---

### ~/Library/Preferences/
**What:** App preference/settings files. Usually tiny `.plist` files — EXCEPT some apps abuse this.

| Notable | What It Actually Is |
|---------|-------------------|
| `Ableton/Live 12.x.x/` | Per-version Ableton settings |
| ↳ `Crash/` | **Crash memory dumps.** Ableton dumps its entire RAM state when it crashes. Each crash = hundreds of MB to several GB. Completely useless unless you're debugging Ableton itself. **Always safe to delete.** |
| ↳ `Undo/` | Undo history state files. Safe to clear (you lose undo history for previous sessions). |

---

### ~/Library/Containers/
**What:** macOS **sandboxed app storage.** Apps from the App Store (and some others) get isolated containers so they can't access your full filesystem.

| Container | What It Actually Is |
|-----------|-------------------|
| `com.apple.MobileSMS/` | **iMessage sandbox data** — additional message database copies and attachment references (separate from ~/Library/Messages). |
| `com.docker.docker/` | Docker Desktop's Linux VM disk images and container data. |
| `com.canva.canvaeditor/` | Canva's offline project cache. |
| `com.apple.Safari/` | Safari browser data (history, cache, extensions). |

---

### ~/Library/Metadata/
**What:** System indexing data.

| Subfolder | What It Actually Is |
|-----------|-------------------|
| `CoreSpotlight/` | **Spotlight search index.** macOS indexes every file on your disk for instant search. Rebuilds if deleted, but takes hours. Don't delete unless Spotlight is broken. |

---

### ~/Library/Logs/
**What:** App log files. Text-based diagnostic output. **Always safe to delete** — apps create fresh logs on next launch.

---

## Hidden Dot Folders (~/.*)

| Folder | What It Actually Is |
|--------|-------------------|
| `.gemini/` | **Google Gemini CLI tool.** `antigravity-browser-profile/` = a full Chromium browser profile Gemini uses for web browsing features. `antigravity/` = the Gemini CLI binary and runtime. `tmp_npm_cache/` = npm packages Gemini installs for code execution. **All safe to delete if not actively using Gemini CLI.** |
| `.cache/` | XDG cache directory. Various tools dump temp files here. Always safe to clear. |
| `.langflow/` | **Langflow** — visual LLM workflow builder. Contains runtime data, downloaded models, and flow definitions. Safe to delete if not using. |
| `.npm/` | **npm package cache.** Every package you've ever `npm install`'d is cached here. `npm cache clean --force` to clear. Safe — packages re-download from registry. |
| `.vscode/` | VS Code extensions and global settings. |
| `.nvm/` | **Node Version Manager.** Stores multiple Node.js versions. Each version ~100-150 MB. `nvm ls` shows installed versions, `nvm uninstall <version>` to remove old ones. |
| `.local/` | XDG local data. Often contains `pipx` installed Python tools, `share/` data. |
| `.antigravity/` | Google Antigravity tool data (Chromium-based). |
| `.claude/` | **Claude Code CLI** config, project memory files, conversation history. |
| `.cursor/` | Cursor AI editor extensions and workspace data. |
| `.docker/` | Docker CLI config (NOT the VM images — those are in Containers). |
| `.Trash/` | Your trash bin. `Empty Trash` in Finder or leave it. |
| `.config/` | XDG config directory. App configs that follow Linux conventions. |

---

## Quick Reference: What's Safe to Delete?

| Safety Level | Items |
|-------------|-------|
| **ALWAYS SAFE** | All Caches, all .ShipIt folders, all Logs, Crash dumps, vm_bundles, GoogleUpdater, npm/pip/pnpm/Homebrew caches |
| **SAFE IF NOT USING THE APP** | Gemini data, Langflow, Sidify, Wineskin, Comet, WebCatalog, Antigravity |
| **SAFE BUT SLOW REBUILD** | Spotlight index, Ableton Live Database, Chrome OptGuideOnDeviceModel |
| **CAUTION** | iMessage Attachments (use macOS Storage settings, not Finder), FileProvider (system-managed), CloudStorage duplicates (verify first) |
| **DO NOT DELETE** | Preferences .cfg/.plist files, Keychain, Active app databases, Photos Library |

---

*Last updated: 2/21/26*
