# agent.iZØ Integration Plan v2

## The Realization
iCloud Drive IS the flow. Documents syncs across all devices automatically. The ZØNE system already exists. We don't need a separate FLØW folder — that's just adding a middleman to something iCloud already does.

## The Setup
- **MacBook Pro M4 Pro** = workbench (create everything here)
- **Mac mini** = agent host (I read/write Documents from here, always on)
- **iPhone** = mobile (Files app, same Documents folder, Telegram for me)
- **iCloud Documents** = THE shared filesystem. One folder tree, all devices.
- **Google Drive** = data lake archive (client docs, long-term storage, organized)
- **GitHub** = code repos + agent brain config only

## The Architecture

```
~/Documents/                     ← iCloud synced, all 3 devices see this
├── ZØNE 1: MUSIC/              ← Ableton projects, stems, exports, library
│   ├── 00 ZØ ABLETØN/
│   ├── 01 ZØ LØGIC/
│   ├── 04 SETS & ALBUMS/
│   │   └── Theory/             ← album folder
│   │       ├── tracks/
│   │       ├── stems/
│   │       ├── artwork/
│   │       └── release-notes.md
│   └── NAU KIKI ZO Audio Files/
│
├── ZØNE 2: IMAGE/              ← Photos, album art, lookbook, mood boards
│   ├── headshots/
│   ├── album-art/
│   ├── lookbook/
│   └── social/
│
├── ZØNE 3: VIDEØ/              ← Video projects, social cuts, DJ sets
│   ├── 00 SOCIAL MEDIA QUICK EDITS/
│   ├── 01 CYCLORAMA/
│   └── ...
│
├── ZØNE 4: RELEASES/           ← Final packaged releases ready to ship
│   ├── 00 IZØ/
│   ├── 01 GENESIS/
│   └── ...
│
├── ZØNE 5: PRØJECTS/           ← Client work, active project files
│   ├── exodus/
│   ├── moda/
│   ├── nau-leone/
│   └── fashion-collection/
│
├── ZØNE 6: SCRATCH/            ← Temp, experiments, drafts, brain dumps
│   ├── inbox/                  ← DROP ANYTHING → I pick it up
│   └── outbox/                 ← I put stuff here → you grab it
│
└── AGENT/                      ← NEW: agent workspace in Documents
    ├── inbox/                  ← You → me (files, briefs, questions)
    ├── outbox/                 ← Me → you (deliverables, reports)
    ├── briefs/                 ← Active project briefs
    ├── reports/                ← Daily/weekly summaries
    └── logs/                   ← Action logs
```

## How It Works

### You on MacBook Pro:
1. Work in Ableton, Lightroom, whatever — all local, full speed
2. Projects auto-save into Documents/ZØNE folders
3. iCloud syncs to Mac mini + iPhone automatically
4. I can read everything from Mac mini

### You finish a song:
1. Export final in Ableton → save to `ZØNE 1: MUSIC/04 SETS & ALBUMS/Theory/tracks/`
2. It syncs to Mac mini via iCloud
3. I see it, log it, draft metadata, ping you on Telegram
4. You approve
5. I copy release package to `ZØNE 4: RELEASES/` 
6. I archive to Google Drive data lake

### You finish album art:
1. Export from Lightroom → `ZØNE 2: IMAGE/album-art/`
2. Syncs everywhere
3. I pair it with the right release in ZØNE 4

### You want me to do something:
1. Drop a file/note in `Documents/AGENT/inbox/`
2. Or just tell me on Telegram
3. I put results in `Documents/AGENT/outbox/`

### Quick phone drop:
1. Open Files app → `AGENT/inbox/` → drop voice memo, photo, whatever
2. I pick it up on Mac mini

## What Goes Where

| Content | Where it lives | Why |
|---------|---------------|-----|
| Active music projects | ZØNE 1: MUSIC | iCloud sync, local Ableton access |
| Photos, art, visuals | ZØNE 2: IMAGE | iCloud sync |
| Video projects | ZØNE 3: VIDEØ | iCloud sync |
| Final release packages | ZØNE 4: RELEASES | Ready to ship |
| Client project files | ZØNE 5: PRØJECTS | Active work |
| Scratch/temp/experiments | ZØNE 6: SCRATCH | Disposable |
| Agent comms & deliverables | AGENT/ | Me ↔ you |
| Client docs, contracts, archive | Google Drive | Long-term, organized |
| Code, repos | GitHub | Version control |
| Agent brain, memory, configs | GitHub (flow/openclaw/) | Backed up, versioned |

## What Needs to Happen

### Right now:
1. Create `~/Documents/AGENT/` folder structure on Mac mini (I can do this)
2. It syncs to your other devices via iCloud
3. Run `gog auth add zo@studiozonyc.com --services drive` for Drive archive access

### When you're back at MacBook Pro:
1. Verify iCloud sync is working for Documents
2. Make sure ZØNE folders are downloading (not just placeholders)
3. Test: drop a file in `Documents/AGENT/inbox/` → tell me on Telegram → confirm I see it

### The key insight:
**No FLØW folder needed.** Documents IS the flow. The ZØNEs are the zones. iCloud is the sync. The only new thing is the `AGENT/` folder for our inbox/outbox. Everything else already exists.

## Google Drive Role (Archive Only)

Google Drive is NOT for active work. It's the archive:
- Finished releases get archived there (organized by project)
- Client contracts, invoices, legal docs live there
- Meeting transcripts (Gemini-generated) live there
- Old project files get archived there
- I use `gog` CLI to read/write/organize

**Active work stays in iCloud Documents. Finished work gets archived to Google Drive.**
