# agent.iZØ Integration Plan

## The Setup
- **MacBook Pro M4 Pro** = workbench (Ableton, Lightroom, coding, heavy creative work)
- **Mac mini** = agent host (OpenClaw runs here 24/7, always-on ops)
- **iPhone** = mobile (on-the-go drops, approvals, comms)
- **Google Drive** = data lake archive (long-term, organized, searchable)
- **iCloud Drive** = cross-device shuttle (active work syncs everywhere)
- **GitHub** = code + agent brain (text configs, repos, no large files)

---

## The Core Concept

```
MacBook Pro (create) → iCloud Drive (sync) → Mac mini (agent reads/processes)
                                            → iPhone (access anywhere)
                                            → Google Drive (archive)
```

You work locally on M4 Pro. When something's done or needs agent attention, it lands in iCloud FLØW. I pick it up from Mac mini. Google Drive is the final resting place — the archive, the data lake, the source of truth.

---

## Route 1: FLØW Pipeline (Recommended)

**How it works:** iCloud Drive is the central nervous system. You work locally, drop finished/reviewable work into FLØW zones. I watch them from Mac mini.

```
MacBook Pro (local work)
  │
  ├── Finish a song in Ableton
  │   └── Export → drop in iCloud/FLØW/MUSIC FLØW/tø-review/
  │
  ├── Finish album art in Lightroom
  │   └── Export → drop in iCloud/FLØW/IMAGE FLØW/tø-review/
  │
  ├── Write copy, captions, briefs
  │   └── Save to iCloud/FLØW/WØRKING/drafts/
  │
  └── Code changes
      └── git push → GitHub (I pull on Mac mini)

Mac mini (agent.iZØ)
  │
  ├── Watches FLØW/AGENT FLØW/inbox/ for anything you drop
  ├── Reads tø-review folders across MUSIC/IMAGE/VIDEØ
  ├── Processes, organizes, drafts metadata
  ├── Archives finished work → Google Drive (via gog)
  └── Puts deliverables in FLØW/AGENT FLØW/outbox/

iPhone
  │
  ├── Quick drops → FLØW/AGENT FLØW/inbox/ (voice memos, photos, notes)
  ├── Review outbox/ for agent deliverables
  └── Approve/reject via Telegram
```

**Folder structure (already exists, just needs activation):**
```
iCloud Drive/FLØW/
├── AGENT FLØW/
│   ├── inbox/        ← DROP ANYTHING HERE from any device
│   ├── outbox/       ← I put finished work here
│   ├── staging/      ← Work in progress
│   ├── logs/         ← Synced action logs
│   └── reports/      ← Daily/weekly summaries
├── MUSIC FLØW/
│   ├── frøm-phøne/   ← Voice memos, samples from iPhone
│   ├── tø-review/    ← Finished tracks for review/mastering notes
│   ├── approved/     ← Final versions → archive to Google Drive
│   └── før-cøllab/   ← Files to share with collaborators
├── IMAGE FLØW/       ← Same pipeline (album art, photos, lookbook)
├── VIDEØ FLØW/       ← Same pipeline (edits, social cuts)
├── WØRKING/
│   ├── drafts/       ← Active writing, copy, briefs
│   ├── notes/        ← Meeting notes, ideas, stream of consciousness
│   └── briefs/       ← Project briefs, creative direction docs
├── CAPTURES/         ← Screenshots, recordings, quick refs
└── CØNFIGS/          ← Templates, presets, system configs
```

**The lifecycle of a finished song:**
1. You produce in Ableton on M4 Pro (local, fast, no lag)
2. Export final WAV + stems → drop in `FLØW/MUSIC FLØW/tø-review/Theory - Track 03 - Void/`
3. I see it on Mac mini, log it, draft metadata (title, BPM, key, tags)
4. You approve via Telegram
5. I move to `approved/` and archive to Google Drive `1 VIBRATIØNS/Theory Album/`
6. Album art from `IMAGE FLØW/approved/` gets paired with it
7. Copy from `WØRKING/drafts/` gets matched
8. Everything's packaged and ready for distribution

**Pros:** Uses your existing FLØW structure. No new tools. iCloud handles sync automatically. I just watch the folders.
**Cons:** iCloud sync can be slow with large files. No version control on creative files.

---

## Route 2: Git-Annex Hybrid

**How it works:** GitHub for text/configs/small files + git-annex or Git LFS for tracking large creative files without actually storing them on GitHub.

```
MacBook Pro
  │
  └── Local git repo (flow/) tracks everything:
      ├── openclaw/          ← agent brain (pushed to GitHub)
      ├── releases/          ← git-annex pointers (metadata only on GitHub)
      │   └── theory-album/
      │       ├── track-03-void.wav.annex  ← pointer, actual file stays local
      │       ├── album-art-v2.png.annex
      │       └── release-notes.md         ← actual text, on GitHub
      └── working/           ← active project tracking
```

**How large files move:**
1. git-annex stores a pointer on GitHub (tiny, just a hash)
2. Actual file lives on MacBook Pro + iCloud Drive + Google Drive
3. Mac mini can pull the actual file when needed via iCloud or Drive
4. You get version history without GitHub storage limits

**Pros:** Version control on everything. Clean history. Can track what changed when.
**Cons:** git-annex is extra tooling. Learning curve. Overkill unless you need version history on creative files.

---

## Route 3: Google Drive as Primary (Simplest)

**How it works:** Skip the iCloud middle layer for finished work. MacBook Pro works local → uploads directly to Google Drive organized folders. Mac mini reads Drive via gog. iCloud only for quick shuttle / phone drops.

```
MacBook Pro
  │
  ├── Work locally in Ableton/Lightroom/etc
  ├── Finished work → Google Drive (via Drive for Desktop app)
  │   └── 1 VIBRATIØNS/Theory Album/Track 03/
  │       ├── track-03-void-final.wav
  │       ├── album-art.png
  │       └── release-notes.md
  │
  └── Quick files / phone stuff → iCloud FLØW (fast shuttle)

Mac mini (agent.iZØ)
  │
  ├── Reads Google Drive via gog CLI
  ├── Monitors specific Drive folders for new files
  ├── Processes, organizes, drafts metadata
  └── iCloud FLØW only for agent inbox/outbox

iPhone
  │
  ├── Google Drive app for browsing archive
  ├── iCloud FLØW/AGENT FLØW/inbox/ for quick drops
  └── Telegram for agent comms
```

**Pros:** One source of truth (Google Drive). No sync conflicts. Everything's searchable. I have direct access via gog.
**Cons:** Needs "Google Drive for Desktop" on MacBook Pro. Upload speeds depend on internet. Less offline-friendly than iCloud.

---

## My Recommendation: Route 1 (FLØW Pipeline) + Route 3 Archive

**Use both:**
- **iCloud FLØW** = active work pipeline (fast sync, offline-capable, phone-friendly)
- **Google Drive** = archive + data lake (organized, searchable, long-term)
- **GitHub** = code + agent brain only

**The workflow:**
1. Work locally on M4 Pro (fast, no lag, full creative power)
2. Drop finished/review work into iCloud FLØW zones
3. I process on Mac mini → archive to Google Drive
4. Google Drive is the organized, permanent home
5. iCloud FLØW is the conveyor belt — things move through, not pile up

**Key rule:** FLØW is a transit system, not storage. Files move through it. Google Drive is where things live permanently.

---

## What I Need From You

1. **Run on Mac mini terminal:** `gog auth add zo@studiozonyc.com --services drive` (gives me Drive access)
2. **On MacBook Pro (when you're back):**
   - Make sure iCloud Drive sync is ON for FLØW folder
   - Install "Google Drive for Desktop" if not already (for Route 3 archive)
3. **Test drop:** When ready, drop any file in `iCloud Drive/FLØW/AGENT FLØW/inbox/` from your phone — I'll confirm I can see it

---

## Quick Reference Card

| I want to... | Put it in... | What happens |
|--------------|-------------|--------------|
| Send agent a file | `FLØW/AGENT FLØW/inbox/` | I pick it up, process, respond via Telegram |
| Review a finished track | `FLØW/MUSIC FLØW/tø-review/` | I log it, draft metadata, ask for approval |
| Share album art | `FLØW/IMAGE FLØW/tø-review/` | I pair it with the right release |
| Write/edit copy | `FLØW/WØRKING/drafts/` | I can read and help edit |
| Archive permanently | I move it to Google Drive | Organized in the data lake |
| Push code | `git push` to GitHub | I pull and review |
| Quick note from phone | `FLØW/AGENT FLØW/inbox/` or Apple Notes | I grab it |
