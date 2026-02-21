# ZØ DATA MANAGEMENT v1.5 — Zones · Flows · Lake

> *Build in the Zønes. Møve thrøugh the Fløws. Settle in the Lake.*

---

**3 devices · 2 cløuds · 4 tiers · 1 system**

---

## THE MENTAL MØDEL

Yøur data lives across four tiers and three devices. Each tier has a jøb. Each device has a røle. Files flow between them — never stagnate.

```
┌─────────────────────────────────────────────────────────────────────┐
│                                                                     │
│   GØØGLE DRIVE (6TB)             <- THE LAKE                       │
│   Decimal System v5.              Permanent. Ørganized. Still.     │
│   Søurce øf truth.               Everything settles here           │
│   Finalcuts + zipped søurces.     when it's døne.                  │
│                                                                     │
│   M4PRO (MacBøøk Prø, 1TB)      <- THE WØRKBENCH                  │
│   Speed. Active wørk.            ZØNES live here. Løcal. Fast.    │
│   Music Zøne / Image Zøne /      Things land, get wørked øn,      │
│   Videø Zøne / Cøde / Releases   and ship øut.                    │
│                                                                     │
│   iCLØUD DRIVE (6TB)             <- THE RIVER                      │
│   Crøss-device sync.             FLØWS live inside FLØW/.         │
│   Music Fløw / Image Fløw /      Files møve THRØUGH here.         │
│   Videø Fløw / Agent Fløw        Nøthing stagnates. Everything    │
│   Døwnløad øn demand.            is in møtiøn ør gets filed.      │
│                                                                     │
│   MAC MINI (256GB)               <- THE AGENT                      │
│   ØpenClaw daemon.               Runs agent.iZØ 24/7.             │
│   Always øn. Lean.               Streams everything.               │
│   Acts øn files, døesn't høard.  Yøur 24/7 øperatør.             │
│                                                                     │
│   EXTERNAL HARD DRIVE            <- THE VAULT                      │
│   Raw føøtage. Full mirrørs.     Insurance. Quarterly.             │
│   Plug in, back up, discønnect.                                    │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## THE 3 DEVICES

| Device | Storage | Role | Always On? |
|--------|---------|------|------------|
| **M4Pro** (MacBook Pro) | 1TB SSD | Creative workhorse — where you MAKE things | No |
| **Mac Mini** (agent.iZØ) | 256GB SSD | OpenClaw agent daemon — 24/7 operator | Yes |
| **iPhone** | ~256GB | Command center — review, approve, capture | Yes |

## THE 2 CLØUDS

| Service | Capacity | Role | Metaphor |
|---------|----------|------|----------|
| **Google Drive** (Studio ZO) | 6TB | Decimal System — permanent archive | **The Lake** |
| **Apple iCloud** | 6TB | Cross-device sync — operational handoffs | **The River** |

---

## THE LAKE vs. THE RIVER

**The Lake** (Google Drive) is where things *live permanently*. Deep. Still. Organized. The Decimal System with 10 domains and 100 slots. Source of truth. You stream from it, you archive to it. Nothing moves once it settles.

**The River** (iCloud Drive) is how things *move between devices in real-time*. Files flow through it. Drafts, captures, handoffs, agent outputs. Almost nothing is permanent here — the exceptions are CØNFIGS/ and WØRKING/ which hold slow-evolving living files. Everything else gets filed to The Lake when done. The River stays clean and in motion.

**Why two clouds?** Google Drive has your entire organizational system — the Decimal System v5. Moving that would be insane. But Google Drive doesn't have native Apple sync across three devices. iCloud does. iCloud is built into Finder, built into Files on iPhone, built into every Apple app. It syncs instantly across M4Pro, Mac Mini, and iPhone. So Google Drive stays the archive. iCloud becomes the operational layer.

---

## iCLØUD: THE FLØW/ PARENT FOLDER APPRØACH

**CRITICAL:** Dø nøt restructure yøur existing iCløud setup. Dø nøt move anything. Dø nøt turn øff Desktøp & Døcuments sync yet (especially at 98% disk capacity — this is delicate). Instead, create ONE new folder inside iCløud Drive called `FLØW/`. Yøur entire river system lives inside it. Everything existing stays untøuched.

```
iCloud Drive/
├── [all existing stuff — DØN'T TØUCH]
├── Desktop/                ← still synced, leave før nøw
├── Documents/              ← still synced, leave før nøw
├── iCloud videos/          ← the 189GB — handle during cleanup phase
│
└── FLØW/                   ← CREATE THIS. The river lives here.
    ├── MUSIC FLØW/
    ├── IMAGE FLØW/
    ├── VIDEØ FLØW/
    ├── AGENT FLØW/
    ├── WØRKING/
    ├── CAPTURES/
    └── CØNFIGS/
```

This is **migration-safe**. Yøu can start using FLØW/ immediately while we figure øut the iCløud cleanup separately. When we eventually turn øff Desktøp & Døcuments sync and clean up legacy iCløud, FLØW/ wøn't be affected.

### iCloud Setup (Current — Migration-Safe)

| Setting | M4Pro | Mac Mini | iPhone |
|---------|-------|----------|--------|
| **iCloud Drive** | ON | ON | ON (native) |
| **Desktop & Documents Sync** | ON (leave for now) | OFF | N/A |
| **Optimize Mac Storage** | ON (you're at 98%) | ON — mandatory (256GB) | Default |

### iCloud Setup (Target — After Cleanup)

| Setting | M4Pro | Mac Mini | iPhone |
|---------|-------|----------|--------|
| **iCloud Drive** | ON | ON | ON (native) |
| **Desktop & Documents Sync** | OFF | OFF | N/A |
| **Optimize Mac Storage** | Optional (with space freed) | ON — mandatory (256GB) | Default |

### What Happens When You Turn Off Desktop & Documents Sync (Later)

When you turn it OFF, macOS does **NOT** delete your files from iCloud. Your local Desktop and Documents become local-only again. Files that were synced stay in iCloud Drive under folders called "Desktop" and "Documents" — still accessible from iPhone and Mac Mini. However, files that were cloud-only (evicted from local to save space) may disappear from local view. At 98% capacity, macOS has likely evicted many files. **Handle this only after freeing up SSD space and building out zones.**

---

## TIER 1 — M4PRO LØCAL SSD (The Wørkbench)

**Philøsøphy:** Yøur M4Pro is a wørkbench, nøt a warehøuse. Things land, get wørked øn, and ship øut. Nøthing permanent. Clean, fast, lean. ZØNES live here.

### SSD Applicatiøn Architecture

The løcal SSD høsts three creative wørkstatiøn zønes, ørganized by media type. Each zøne grøups the apps that share søurce files, plugins, and I/Ø demands.

```
┌─────────────────────────────────────────────────────────────────────┐
│  SSD APPLICATIØN ZØNES                                              │
│                                                                     │
│  MUSIC ZØNE            IMAGE ZØNE            VIDEØ ZØNE            │
│  ~/Music/              ~/Image/              ~/Videø/               │
│                                                                     │
│  Abletøn Live          Adøbe Phøtøshøp      Adøbe Premiere Prø    │
│                        Adøbe Lightrøøm      DaVinci Resølve       │
│                        Adøbe Illustratør    TøuchDesigner          │
│                                                                     │
│  WHY ISØLATED:         WHY GRØUPED:          WHY GRØUPED:          │
│  Latency-critical.     Shared PSD/AI/RAW     Shared timelines,     │
│  Exclusive audiø       asset pipeline.       føøtage, renders.     │
│  I/Ø. Samples,         LUTs, cølørs,        GPU-intensive.        │
│  presets, rekørdbox    expørt handøffs       Møtiøn + cømpøsiting │
│  all need dedicated    between apps.          pipeline.             │
│  fast paths.                                                        │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### M4Pro Zøne Scaffølding

```
~/                                          M4PRO LOCAL SSD (1TB) — THE WØRKBENCH
│
├── Desktøp/                                <- LANDING PAD. Nøthing stays. Sørt weekly.
│                                              (Currently iCløud-synced — leave før nøw)
│
├── Cøde/                                   <- CØDE ZØNE — all git repøs, NEVER cløud-synced
│   ├── savaya/                                Synced via GitHub ønly. See CØDE RULES beløw.
│   ├── prømetheus/
│   ├── harmønia/
│   ├── øpenclaw-skills/                       Shared between M4Pro + Mac Mini via git
│   ├── studiøzønyc/
│   ├── data-management/                       VS Cøde wørkspace før this system
│   └── experiments/
│
├── Music/                                  <- MUSIC ZØNE — latency-critical, isølated
│   ├── DJ-Library/                           ALWAYS LOCAL — rekørdbox, never cløud
│   │   ├── rekørdbox/                          Database, settings, analysis
│   │   ├── tribal-ørganica/
│   │   ├── hard-technø/
│   │   ├── prøgressive-melødic/
│   │   ├── afrø-ørganic/
│   │   ├── ambient-dønntempø/
│   │   └── incøming/                           New tracks tø sørt intø crates
│   │
│   ├── Samples/                              ALWAYS LOCAL — Shamanic Wheel
│   │   ├── vøid/
│   │   ├── machine/
│   │   ├── earth/
│   │   ├── tribe/
│   │   ├── water/
│   │   ├── heart/
│   │   ├── bødy/
│   │   ├── shadøw/
│   │   ├── cøsmøs/
│   │   ├── fire/
│   │   └── field-recørdings/
│   │
│   └── Presets/                              ALWAYS LOCAL — plugin presets
│       ├── serum/
│       ├── diva/
│       ├── fabfilter/
│       └── abletøn-racks/
│
├── Image/                                  <- IMAGE ZØNE — Phøtøshøp, Lightrøøm, Illustratør
│   ├── lightrøøm-cataløg/                    ALWAYS LOCAL — never cløud
│   ├── wørking/                               Active PSD/AI/RAW editing sessiøns
│   └── expørts/                               Finished stills → Releases/ ør FLØW
│
├── Videø/                                  <- VIDEØ ZØNE — Premiere, Resølve, TøuchDesigner
│   ├── wørking/                               Active Premiere/Resølve prøjects
│   ├── renders/                               Render cache, intermediate øutputs
│   ├── tøuchdesigner/                         TD prøjects + live visuals
│   │   ├── tutørials/
│   │   └── live-visuals/
│   └── expørts/                               Finals → Releases/ ør FLØW
│
├── Releases/                               <- ACTIVE ASSEMBLY — crøss-zøne cønvergence
│   ├── surf-ørganica-videø/                   Elements cønverging toward a final øutput.
│   ├── entheos-sunrise-set/                   A release = audiø + videø + artwørk + assets
│   ├── current-cøllectiøn/                   cøming tøgether før a deliverable.
│   └── .../                                   -> SHIPS TØ LAKE WHEN DØNE
│                                              -> PURGE LØCAL AFTER ARCHIVE
│
├── Prøjects/                               <- ØPEN-ENDED WØRK — may never "finish"
│   ├── bali-trip-planning/
│   ├── apartment-hunt/
│   ├── wørkshøp-curriculum/
│   └── .../
│
└── Scratch/                                <- DISPØSABLE — thrøwaway wørking files
    └── [sessiøn-name]/
```

### RELEASES vs. PRØJECTS

| | Releases/ | Prøjects/ |
|---|---|---|
| **Purpose** | Converging toward a final deliverable | Open-ended, living, multi-purpose |
| **Examples** | Music release, video edit, campaign drop | Trip planning, apartment search, curriculum |
| **Lifecycle** | Active → Ship → Archive → Purge local | Stays as long as it's useful |
| **End state** | Finalcuts + zip → Lake, local deleted | May never "finish" — and that's fine |
| **Archive to** | Lake/9 ARCHIVE/ | Lake/7 PRØJECTS/ or stays local |

### Zøne Rules

| Rule | Why |
|------|-----|
| **Zones are LOCAL ONLY** | Speed. Isolation. No sync overhead. |
| **No repos in cloud-synced folders** | `.git` corruption, `node_modules` nightmares |
| **No DAW projects in any cloud** | Ableton chokes on streamed files, latency kills |
| **No Rekordbox in any cloud** | Needs direct SSD access, always local |
| **Desktop = inbox, not storage** | Process weekly or it becomes a landfill |
| **`~/Releases/` is temporary** | Ships to Lake when done, local gets purged |
| **`~/Projects/` can persist** | Open-ended work lives as long as needed |
| **Export to FLØW for cross-device** | When you need something on another device → River |

---

## CØDE RULES — SYNCING BETWEEN M4PRO + MAC MINI

Cøde repøs **NEVER** live in a cløud-synced folder. Nøt iCløud. Nøt Gøøgle Drive. Git is the sync mechanism between devices. Always.

### Høw Cøde Syncs

```
M4Pro                          Mac Mini                     GitHub
~/Cøde/                        ~/Cøde/                      (remote)
│                               │
├── savaya/          <──push/pull──>                <──push/pull──>  savaya repø
├── prømetheus/      <──push/pull──>                <──push/pull──>  prømetheus repø
├── harmønia/        <──push/pull──>                <──push/pull──>  harmønia repø
├── øpenclaw-skills/ <──push/pull──>  ~/Cøde/øpenclaw-skills/       øpenclaw-skills repø
├── data-management/ <──push/pull──>  ~/Cøde/data-management/       data-mgmt repø
├── studiøzønyc/     <──push/pull──>                <──push/pull──>  studiøzønyc repø
└── experiments/
```

### The Wørkflow

1. **You write code on M4Pro** in `~/Code/[repo]/`
2. **You push to GitHub** (`git push`)
3. **Mac Mini pulls from GitHub** (`git pull`) when it needs to run or reference something
4. **OpenClaw custom skills** live in `~/Code/openclaw-skills/` — develop on M4Pro, push, Mini pulls
5. **VS Code workspaces** (`.code-workspace` files) live inside the repo alongside everything else

### Cøde Rules

| Rule | Why |
|------|-----|
| **All repos at `~/Code/` on both devices** | Consistent, predictable location |
| **Git is the ONLY sync mechanism for code** | Cloud sync corrupts `.git`, bloats `node_modules` |
| **Never put repos in iCloud Drive** | `.git` corruption, sync conflicts |
| **Never put repos in Google Drive** | Same reason — cloud sync breaks version control |
| **Push before you leave M4Pro** | Mini can only pull what's been pushed |
| **VS Code Settings Sync is fine** | Uses GitHub/Microsoft account — separate from file sync |
| **`.code-workspace` files live in the repo** | Travel with the code, not stored separately |
| **Agent configs in a repo** | `openclaw-skills/` repo means both devices stay in sync |

### What Lives Where (Cøde Split)

| What | Where | Why |
|------|-------|-----|
| **The actual code** | `~/Code/[repo]/` on M4Pro and Mac Mini | Local SSD, fast, git-versioned |
| **Docs, specs, briefs about the code** | `Google Drive/4 AGENTIC/` | Lake — permanent reference |
| **VS Code workspace files** | Inside the repo | Travels with the code |
| **VS Code user settings** | VS Code Settings Sync (cloud) | Separate system, fine |
| **API keys, secrets** | `.env` files (gitignored) or system env vars | Never in repos, never in cloud |

---

## TIER 2 — iCLØUD DRIVE (The River)

**Philøsøphy:** The River is høw things møve between devices. Files fløw thrøugh — they døn't live here (with twø exceptiøns: CØNFIGS/ and WØRKING/ which høld sløw-evølving living files). Every creative domain has a Zøne (løcal, fast) and a cørrespønding Fløw (synced, visible). If it matters permanently, it gøes tø the Lake.

### FLØW Scaffølding

All flows live inside a single `FLØW/` parent folder in iCloud Drive. This is migration-safe — nothing in your existing iCloud gets touched.

```
iCløud Drive/                               THE RIVER (6TB)
│
├── [existing iCløud cøntent — DØN'T TØUCH]
│
└── FLØW/                                   <- THE RIVER LIVES HERE
    │
    ├── MUSIC FLØW/                         <- FLØW — audiø in transit
    │   ├── tø-review/                        Bøunces, drafts, røugh mixes
    │   ├── frøm-phøne/                      Vøice memøs, field recørdings, Shazams
    │   ├── før-cøllab/                       Files tø send ør share
    │   └── approved/                         Reviewed → ready tø archive tø Lake
    │
    ├── IMAGE FLØW/                         <- FLØW — visuals in transit
    │   ├── tø-review/                        Draft designs, cøver art øptiøns
    │   ├── frøm-phøne/                      Screenshøts, phøtø captures, refs
    │   ├── før-cøllab/                       Files tø send ør share
    │   └── approved/                         Reviewed → ready tø archive tø Lake
    │
    ├── VIDEØ FLØW/                         <- FLØW — møtiøn in transit
    │   ├── tø-review/                        Render previews, cut versiøns
    │   ├── frøm-phøne/                      Phøne videø captures
    │   ├── før-cøllab/                       Files tø send ør share
    │   └── approved/                         Reviewed → ready tø archive tø Lake
    │
    ├── AGENT FLØW/                         <- FLØW — agent.iZØ øperatiøns
    │   ├── inbox/                            Drøp files here → agent prøcesses them
    │   ├── outbox/                           Agent øutputs → yøu review
    │   ├── staging/                          Cøntent awaiting yøur apprøval
    │   ├── reports/                          Daily briefings, status updates
    │   └── logs/                             Agent activity løgs
    │
    ├── WØRKING/                            <- SLØW FLØW — crøss-device døcuments
    │   ├── notes/                            Quick nøtes, ideas, vøice transcripts
    │   ├── drafts/                           Døcs in prøgress
    │   └── briefs/                           Prøject briefs, specs
    │                                         * CAN BE PERSISTENT — living døcs stay here
    │
    ├── CAPTURES/                           <- FLØW — iPhøne → everywhere
    │   ├── screenshots/                      Screen grabs, inspiratiøn
    │   ├── recordings/                       Vøice memøs, audiø captures
    │   └── quick-refs/                       Anything snapped før reference
    │
    └── CØNFIGS/                            <- PERSISTENT — shared cønfiguratiøns
        ├── soul.md                           ØpenClaw persønality
        ├── heartbeat.md                      Scheduled task definitiøns
        └── templates/                        Reusable templates
                                              * PERMANENT — these files live here
```

### Fløw Subfolders Explained

Every creative fløw has the same four lanes:

| Subfolder | What it does | Direction |
|-----------|-------------|-----------|
| **to-review/** | Exports from your zone that need eyes on another device | M4Pro → iPhone/Mac Mini |
| **from-phone/** | Captures from iPhone that need to enter a zone | iPhone → M4Pro |
| **for-collab/** | Files staged to share with collaborators or send via agent | Any → outbound |
| **approved/** | Reviewed, approved, ready to be filed to The Lake | River → Lake |

### What Can Be Permanent in FLØW/?

| Folder | Permanent? | Why |
|--------|-----------|-----|
| **MUSIC FLØW/** | No — transit only | Files pass through, get filed to Lake |
| **IMAGE FLØW/** | No — transit only | Files pass through, get filed to Lake |
| **VIDEØ FLØW/** | No — transit only | Files pass through, get filed to Lake |
| **AGENT FLØW/** | No — transit only | Agent processes and clears |
| **WØRKING/** | Yes — slow flow | Living docs, ongoing notes, evolving briefs |
| **CAPTURES/** | No — process weekly | Sort into zones or Lake, don't let pile up |
| **CØNFIGS/** | Yes — permanent | soul.md, heartbeat.md, templates persist here |

Think of it like: the creative flows and agent flow are **fast water** — things move through quickly. WØRKING/ and CØNFIGS/ are **slow water** — still part of the river but holding things that evolve over time rather than rushing through.

### Fløw Rules

| Rule | Why |
|------|-----|
| **All flows live inside `iCloud Drive/FLØW/`** | Migration-safe, one clean namespace |
| **Creative flows are TRANSIT, not storage** | Files pass through, they don't live here |
| **Clear approved/ after filing to Lake** | Keep the river moving |
| **Process from-phone/ weekly** | Don't let captures pile up |
| **Agent Flow inbox cleared after processing** | Agent shouldn't hoard |
| **No DAW projects or git repos in FLØW/** | Same cloud rule — latency kills, git corrupts |
| **Optimize Mac Storage ON (Mac Mini)** | 256GB can't hold everything |
| **WØRKING/ and CØNFIGS/ can be persistent** | Slow flow — living docs and configs stay |
| **Everything else: if done → Lake** | If it matters permanently, archive it |
| **Don't touch existing iCloud until cleanup phase** | FLØW/ is additive, not destructive |

---

## TIER 3 — GØØGLE DRIVE (The Lake)

**Philøsøphy:** This is the Decimal System v5. Søurce øf truth. Permanent. Deep. Still. Everything ørganized, searchable, accessible frøm anywhere. Set tø **STREAM** (nøt mirrør) sø it døesn't eat yøur SSD. Bøth M4Pro and Mac Mini can access it.

### The 10 Domains

```
0  CØRE           Pørtføliø, identity, PR, website, søcials, editørials, admin
1  VIBRATIØNS     Søund, music, DJ, prøductiøn, healing audiø
2  VISUALS        Phøtø, videø, møtiøn, generative, design assets
3  VØGUE          Fashiøn, tech packs, fliers, pøsters, styling, textiles
4  AGENTIC        Cøde, AI, dev, apps, system prømpts, specs
5  PAY THE DØLLS  Marketplace, vendørs, prøducts, cømmerce
6  ADVENTURES     Trips, destinatiøns, planning, archive
7  PRØJECTS       Døwnløads, quick hits, scratch wørk, impulse buys
8  CØLLABS        CRM, clients, bøøkings, partnerships, invøices
9  ARCHIVE        Cømpleted releases — finalcuts + .zip, mirrørs 1-8
```

### Lake Rules

| Rule | Why |
|------|-----|
| **Set to STREAM, not mirror** | Don't eat local SSD with cloud files |
| **Decimal System is source of truth** | Everything organized, searchable |
| **Archive = finalcuts/ + .zip** | Unzipped deliverables + zipped source files |
| **DJ Library does NOT live here** | Rekordbox needs local SSD |
| **13/16 are BACKUP copies** | Primary samples/presets live on M4Pro SSD |
| **70 DOWNLOADS = intake zone** | Everything lands here first, then gets sorted |
| **08 IMPORTS = universal inbox** | New files dump here for unknowns, sort weekly |

*See v1.3 for the full Drive structure with all 100 decimal slots.*

---

## TIER 4 — MAC MINI (The Agent)

**Philøsøphy:** The Mac Mini runs agent.iZØ (ØpenClaw) 24/7. It's yøur always-øn øperatør. It streams everything frøm iCløud and Gøøgle Drive. It downloads files løcally when it needs tø prøcess them, then expørts the results back up. It never høards.

### Mac Mini Setup

| Component | Configuration |
|-----------|--------------|
| **Storage** | 256GB SSD — lean by design |
| **iCloud Drive** | ON, Optimize Mac Storage ON |
| **Google Drive** | Stream (not mirror) |
| **Desktop & Docs sync** | OFF |
| **OpenClaw workspace** | `~/openclaw/workspace/` |
| **Code repos** | `~/Code/` — synced via GitHub, not cloud |
| **Network** | Ethernet — always-on, 24/7 |
| **Display** | Headless OK — SSH/VNC in |

### agent.iZØ — The Retrieve → Prøcess → Expørt Cycle

The agent can download files locally to work on them, then export the results back up. Here's the cycle:

```
┌──────────────────────┐     ┌──────────────────────┐     ┌──────────────────────┐
│                      │     │                      │     │                      │
│   ① RETRIEVE         │     │   ② PRØCESS          │     │   ③ EXPØRT           │
│                      │     │                      │     │                      │
│   From iCloud:       │     │   Agent works in     │     │   To iCloud:         │
│   Finder auto-       │ --> │   ~/openclaw/        │ --> │   FLØW/AGENT FLØW/   │
│   downloads on       │     │   workspace/         │     │   outbox/ or staging/│
│   demand             │     │                      │     │                      │
│                      │     │   Shell commands,    │     │   To Google Drive:   │
│   From Google Drive: │     │   scripts, browser   │     │   Directly to        │
│   Stream mount pulls │     │   automation, API    │     │   Decimal System     │
│   file when accessed │     │   calls              │     │   slots              │
│                      │     │                      │     │                      │
│   From you:          │     │   256GB is fine —    │     │   To you:            │
│   You drop file in   │     │   agent processes    │     │   WhatsApp message   │
│   FLØW/AGENT FLØW/  │     │   then cleans up     │     │   with confirmation  │
│   inbox/             │     │                      │     │                      │
│                      │     │                      │     │                      │
│   From GitHub:       │     │                      │     │                      │
│   git pull to        │     │                      │     │                      │
│   ~/Code/[repo]      │     │                      │     │                      │
│                      │     │                      │     │                      │
└──────────────────────┘     └──────────────────────┘     └──────────────────────┘
```

### Agent File Retrieval Paths

| Agent needs... | It gets it from... | How |
|----------------|-------------------|-----|
| A file you dropped for it | `iCloud Drive/FLØW/AGENT FLØW/inbox/` | iCloud auto-downloads on demand |
| An image you exported | `iCloud Drive/FLØW/IMAGE FLØW/to-review/` | iCloud auto-downloads on demand |
| A phone capture to process | `iCloud Drive/FLØW/CAPTURES/` | iCloud auto-downloads on demand |
| Brand assets, templates | `Google Drive/0 CORE/` | Google Drive stream mount |
| Product images for Shopify | `Google Drive/5 PAY THE DOLLS/` | Google Drive stream mount |
| Code repos to run/monitor | `~/Code/[repo]/` on Mac Mini | `git pull` from GitHub |
| Agent skill definitions | `~/Code/openclaw-skills/` | `git pull` from GitHub |
| Your instructions | WhatsApp / Telegram | OpenClaw messaging gateway |
| Calendar, email | Google Workspace | API-based skills |

### Agent Output Paths

| Output type | Goes to... |
|-------------|-----------|
| Files for your review | `iCloud Drive/FLØW/AGENT FLØW/outbox/` |
| Content awaiting approval | `iCloud Drive/FLØW/AGENT FLØW/staging/` |
| Status reports, briefings | `iCloud Drive/FLØW/AGENT FLØW/reports/` |
| Permanent archive files | `Google Drive/[decimal slot]` directly |
| Confirmations to you | WhatsApp message |

### Agent Rules

| Rule | Why |
|------|-----|
| **Agent downloads locally to process, exports back up** | Retrieve → Process → Export cycle |
| **Workspace is temporary — clean after each job** | 256GB must stay lean |
| **Can read from iCloud FLØW/, Google Drive, and GitHub** | Full access to all data tiers |
| **Can write to iCloud FLØW/ + Google Drive archive** | Output goes where it belongs |
| **Code syncs via git, never cloud folders** | Same rule everywhere |
| **Optimize Mac Storage ON** | Mandatory at 256GB |
| **Agent inbox cleared after processing** | River stays clean |

---

## TIER 5 — EXTERNAL HARD DRIVE (The Vault)

**Philøsøphy:** Insurance and øverflow. Raw føøtage, full prøject mirrørs, anything tøø massive før Drive. Plug in quarterly før backup runs. Nøt daily wørkflow.

```
STUDIØ_ZØ_VAULT/
│
├── RAW_FØØTAGE/                <- Camera øriginals, drøne føøtage
│   ├── surf-ørganica-bali/       These files are HUGE (100GB+ per shøøt)
│   ├── burning-man-2025/         Never deleted — øriginal media
│   └── [shøøt-name]/
│
├── FULL_MIRRØRS/               <- Quarterly snapshøt øf active wørk
│   ├── 2025-Q1/
│   ├── 2025-Q2/
│   └── .../
│
├── MUSIC_VAULT/                <- Full Abletøn prøject backups
│   └── [prøject-name].als + all samples
│
└── ØVERFLOW/                   <- Anything that wøn't fit øn Drive
    └── .../
```

---

## COMPLETE SIGNAL FLØW — Every Path Between Devices

```
THE LAKE ─────────────────────────────────────────────────────────────────────
GØØGLE DRIVE (6TB)    Decimal System v5 · Permanent · Søurce øf Truth
0 CØRE │ 1 VIBRATIØNS │ 2 VISUALS │ 3 VØGUE │ 4 AGENTIC │ 5 PTD │ ...│ 9 ARCHIVE

        │ stream down             │ stream down
        │ ▲ archive up            │ ▲ agent files directly
        ▼                         ▼

THE WØRKBENCH ────────────────┐   THE AGENT ──────────────────────────────
M4PRO (1TB)                   │   MAC MINI (256GB)
                              │   agent.iZØ / ØpenClaw
  MUSIC ZØNE  ~/Music/        │
  IMAGE ZØNE  ~/Image/        │   ┌──────────────────────────┐
  VIDEØ ZØNE  ~/Videø/        │   │ ~/øpenclaw/wørkspace/    │
  CØDE ZØNE   ~/Cøde/        │   │ ~/Cøde/ (via git pull)   │
  ~/Releases/ ~/Prøjects/    │   │ download → prøcess →     │
  ~/Scratch/                  │   │ expørt back up           │
                              │   └────────────│─────────────┘
        │ export to FLØW/     │                │ reads/writes
        │ ▲ pull from FLØW/   │                │
        ▼                     │                ▼

THE RIVER ────────────────────────────────────────────────────────────────────
iCLØUD DRIVE / FLØW/     Synced across ALL 3 DEVICES · Files in møtiøn

  MUSIC FLØW   IMAGE FLØW   VIDEØ FLØW   AGENT FLØW   WØRKING   CAPTURES   CØNFIGS

                │                                       ▲
                │ syncs tø iPhøne                       │ captures frøm camera/vøice
                ▼                                       │

CØMMAND CENTER ───────────────────────────────────────────────────────────────
iPHØNE

  Files app       → brøwse iCløud Drive/FLØW/, review øutputs, preview files
  Camera/Vøice    → save tø FLØW/CAPTURES/ → available everywhere
  WhatsApp        → send input tø agent.iZØ → receive øutput back
  Gøøgle Drive    → brøwse The Lake (read ønly, usually)
```

---

## iPHØNE → AGENT.IZØ CØMMAND FLØW

How you control the agent from your pocket:

```
┌─────────────────┐         ┌─────────────────────────────┐         ┌─────────────────┐
│                 │         │                             │         │                 │
│  YOU (iPhøne)   │         │  AGENT.IZØ (Mac Mini)       │         │  YOU (iPhøne)   │
│                 │         │                             │         │                 │
│  WhatsApp msg:  │  ────>  │  receives message →         │  ────>  │  WhatsApp reply:│
│  "post the moda │         │  retrieves file from        │         │  "✅ Posted to   │
│  flier to IG    │         │  FLØW/AGENT FLØW/inbox →   │         │  @modanyc       │
│  with caption…" │         │  downloads locally →        │         │  Link: insta…"  │
│                 │         │  processes →                │         │                 │
│                 │         │  posts to Instagram API →   │         │                 │
│                 │         │  saves confirmation         │         │                 │
│                 │         │  to FLØW/AGENT FLØW/outbox │         │                 │
│                 │         │                             │         │                 │
└─────────────────┘         └─────────────────────────────┘         └─────────────────┘
     INPUT                        PRØCESS                               ØUTPUT
```

---

## ZØNES vs. FLØWS — The Core Relationship

Every creative domain has a **Zøne** (local container on M4Pro) and a corresponding **Fløw** (synced transit in iCloud/FLØW/). The Zøne is where you build. The Fløw is how things travel.

```
        M4PRO (LOCAL SSD)                    iCLØUD DRIVE / FLØW/
    ┌──────────────────────┐              ┌──────────────────────┐
    │                      │              │                      │
    │   MUSIC ZØNE         │   ──────→    │   MUSIC FLØW         │
    │   ~/Music/           │   exports    │   stems, mixes,      │
    │   Abletøn, Rekørdbox │   handoffs   │   tracks tø review,  │
    │   Samples, Presets   │              │   DJ set drafts      │
    │                      │   ←──────    │                      │
    │                      │   captures   │                      │
    │                      │              │                      │
    │   IMAGE ZØNE         │   ──────→    │   IMAGE FLØW         │
    │   ~/Image/           │   exports    │   cøver art drafts,  │
    │   Phøtøshøp, LR, AI │   handoffs   │   graphics tø review │
    │                      │              │                      │
    │                      │   ←──────    │                      │
    │                      │   captures   │                      │
    │                      │              │                      │
    │   VIDEØ ZØNE         │   ──────→    │   VIDEØ FLØW         │
    │   ~/Videø/           │   exports    │   renders tø review, │
    │   Premiere, Resølve  │   handoffs   │   TD expørts,        │
    │   TøuchDesigner      │              │   prømø clips        │
    │                      │   ←──────    │                      │
    │                      │   refs       │                      │
    └──────────────────────┘              └──────────────────────┘

    FAST. ISØLATED. LØCAL.                SYNCED. VISIBLE. IN MØTIØN.
    Heavy lifting happens here.           All 3 devices see this.
```

---

## THE FLØW — Høw Files Møve

### 1. CREATE → FLØW → SETTLE (Standard Release)

```
1. CREATE                    2. FLØW                     3. SETTLE
   M4Pro Zøne                   iCløud River                Gøøgle Drive Lake
┌──────────────┐           ┌──────────────┐           ┌──────────────┐
│ ~/Music/     │  expørt   │ FLØW/        │  archive  │ 1 VIBRATIØNS/│
│              │  ──────→  │ MUSIC FLØW/  │  ──────→  │ 10 RELEASES/ │
│ Wørk in      │           │ tø-review/   │           │              │
│ Abletøn      │           │              │           │ Permanent    │
│              │  ←──────  │ Review øn    │           │ høme in the  │
│              │  feedback │ phøne/Mini   │           │ Decimal      │
│              │           │              │           │ System       │
│              │           │ Møve tø      │           │              │
│              │           │ approved/    │           │              │
└──────────────┘           └──────────────┘           └──────────────┘

  FAST. LØCAL.               IN MØTIØN. SYNCED.          STILL. ØRGANIZED.
  Where yøu build.           Where things travel.         Where things live.
```

### 2. CAPTURE → FLØW → ZØNE (Phone to Workbench)

```
iPhøne                      iCløud River                M4Pro Zøne
┌──────────────┐           ┌──────────────┐           ┌──────────────┐
│ Camera/Vøice │  capture  │ FLØW/        │  pull in  │ ~/Music/     │
│ memø app     │  ──────→  │ CAPTURES/    │  ──────→  │ Samples/     │
│              │           │ recordings/  │           │ field-rec/   │
│ Hear søund   │           │              │           │              │
│ in street    │           │ Syncs tø     │           │ Nøw in yøur  │
│              │           │ all devices  │           │ DAW          │
└──────────────┘           └──────────────┘           └──────────────┘
```

### 3. AGENT CØMMAND (Phone → Agent → Action)

```
iPhøne                      Mac Mini                     Result
┌──────────────┐           ┌──────────────┐           ┌──────────────┐
│ WhatsApp:    │  message  │ agent.iZØ    │  action   │ Posted tø IG │
│ "post the    │  ──────→  │              │  ──────→  │              │
│ moda flier"  │           │ retrieve →   │           │ Filed tø     │
│              │           │ process →    │           │ Google Drive │
│              │  ←──────  │ export →     │           │              │
│ "✅ done"    │  confirm  │ confirm      │           │ River cleared│
└──────────────┘           └──────────────┘           └──────────────┘
```

### 4. ARCHIVE (Release Complete → Lake)

```
M4Pro                        Lake                         M4Pro
┌──────────────┐           ┌──────────────┐           ┌──────────────┐
│ ~/Releases/  │  finals   │ Drive/9      │           │ ~/Releases/  │
│ surf-ørg/    │  ──────→  │ ARCHIVE/91/  │           │ surf-ørg/    │
│              │           │ finalcuts/   │           │              │
│ finalcuts/   │  zip      │ + .zip       │  purge    │  DELETED     │
│ + everything │  ──────→  │              │  ──────→  │              │
│ else         │           │ Permanent.   │           │ SSD clean    │
│              │           │ Settled.     │           │ før next.    │
└──────────────┘           └──────────────┘           └──────────────┘
```

---

## DEVICE ACCESS MAP

What each device can see and do:

| | M4Pro (Workbench) | Mac Mini (Agent) | iPhone (Command) |
|---|---|---|---|
| **Google Drive (Lake)** | Stream — browse + pull | Stream — browse + pull + write | Google Drive app — browse |
| **iCloud Drive / FLØW/** | Full access — all flows | Full access — Optimize Storage ON | Files app — all flows |
| **Local Zones** | ✅ ONLY HERE | ❌ Not on Mini | ❌ Not on iPhone |
| **Code repos** | `~/Code/` local + GitHub | `~/Code/` local + GitHub | ❌ |
| **OpenClaw daemon** | ❌ Not primary host | ✅ RUNS HERE 24/7 | Control via WhatsApp |
| **Creative apps** | Ableton, Premiere, PS, TD | None | None |
| **Role** | **MAKE** | **EXECUTE** | **COMMAND** |

---

## WEEKLY RITUALS

### Sunday Sørt (15 min)

1. **Process Desktop** — anything on `~/Desktop/` gets sorted or deleted
2. **Process FLØW/ creative flows** — clear `approved/` folders after filing to Lake
3. **Process FLØW/CAPTURES/from-phone/** — sort captures into zones or Lake
4. **Process FLØW/AGENT FLØW/** — clear inbox/outbox of completed items
5. **Check ~/Releases/** — anything done? Archive to Lake. Anything dead? Kill it.
6. **Backup samples/presets** — if changed, sync to Google Drive copies
7. **Git push** — make sure all repos are pushed so Mac Mini can pull

### Mønthly Clean (30 min)

1. **Archive completed releases** — finalcuts to Lake, zip the rest, purge local
2. **Review ~/Code/** — dead branches? Clean up. Push everything.
3. **Check zone working dirs** — `~/Image/working/` and `~/Video/working/` clear?
4. **Check FLØW/ health** — any stale files in flows? Clear them.
5. **Update MASTER PIECES** — new portfolio-worthy work? Add to Lake/00

### Quarterly Vault (1 hour)

1. **Plug in external drive**
2. **Mirror `~/Music/` to MUSIC_VAULT/**
3. **Mirror raw footage from recent shoots**
4. **Full mirror of `~/Releases/` and zone exports to FULL_MIRRORS/[quarter]**
5. **Disconnect, store safely**

---

## NAMING CØNVENTIØNS

### Zøne Folders (M4Pro local)
```
Descriptive, functiønal names:
  Music/DJ-Library/
  Image/wørking/
  Videø/tøuchdesigner/
```

### Fløw Folders (iCloud/FLØW/)
```
DOMAIN FLØW/ with standard lanes:
  FLØW/MUSIC FLØW/tø-review/
  FLØW/IMAGE FLØW/frøm-phøne/
  FLØW/AGENT FLØW/inbox/
```

### Lake Folders (Google Drive)
```
[decimal-id] [NAME]/
  00 MASTER PIECES/
  11 MUSIC LIBRARY/
  40 APPS/
```

### Release Folders (local assembly)
```
[release-name-kebab-case]/
  surf-ørganica-videø/
  entheos-sunrise-set/
```

### Files
```
[prøject]-[descriptør]-[versiøn].[ext]
  surf-ørganica-master-v2.mp4
  entheos-cøver-3000x3000.jpg
```

---

## MIGRATIØN GAMEPLAN

The safe ørder øf øperatiøns, given 98% disk capacity and iCløud Desktøp & Døcuments still ØN:

### Phase 1: Create FLØW/ (Today — 10 min)
Create `iCloud Drive/FLØW/` with all subfolders. Start using immediately. Touches nothing existing.

### Phase 2: Free Up M4Pro SSD (This Week)
Handle the 189GB iCloud videos and other space hogs. Move finished work to Lake. Delete trash. Target: get below 70% capacity.

### Phase 3: Build Zone Folders (After Space Freed)
Create `~/Image/`, `~/Video/`, `~/Releases/`, `~/Projects/`, `~/Scratch/`. Reorganize `~/Music/` internals. Consolidate `~/Code/`.

### Phase 4: Sort the Backlog (One Weekend Session)
Go through Desktop, Downloads, Documents. Every file gets sorted into a zone, filed to Lake, or deleted.

### Phase 5: Turn Off Desktop & Documents Sync (After Zones Built)
Flip the toggle. Desktop and Documents become local-only. Files stay in iCloud accessible via Files app. FLØW/ is unaffected.

### Phase 6: Set Up Mac Mini (Parallel or After)
Install OpenClaw, connect to iCloud Drive/FLØW/ and Google Drive stream, set up `~/Code/` with git repos, configure agent.iZØ.

---

## ØPEN QUESTIØNS

1. **External drive model** — what capacity? SSD or HDD? Current state?
2. **Google Drive storage** — how much of 6TB is used?
3. **iCloud storage** — how much of 6TB is used? What's the biggest space hog?
4. **Mac Mini macOS user** — create dedicated `openclaw` user or use main account?
5. **OpenClaw channel** — WhatsApp primary? Telegram backup?
6. **Agent permissions** — what should agent.iZØ be allowed to do without approval?
7. **Lightroom catalog** — current location? Need to migrate into `~/Image/`?
8. **189GB iCloud videos** — move to Lake? External drive? Delete?
9. **Rekordbox library** — current location? Ready to consolidate into `~/Music/DJ-Library/`?

---

*ZØ DATA MANAGEMENT BRIEF v1.5*
*Built øn the Decimal System v5*
*Zønes · Fløws · Lake*
*February 2026*

> *Build in the Zønes. Møve thrøugh the Fløws. Settle in the Lake.*
> *3 devices · 2 cløuds · 4 tiers · 1 system*

---

## CHANGELØG

### v1.5 (February 2026)
- **FLØW/ parent folder:** All river flows now live inside `iCloud Drive/FLØW/` — migration-safe, touches nothing existing in iCloud
- **Ø branding on M4Pro folders:** Zone scaffolding uses Ø naming convention throughout
- **CØDE RULES section added:** Full documentation of git-based sync between M4Pro and Mac Mini, VS Code workspace handling, what lives where for code
- **CØNFIGS/ and WØRKING/ marked as persistent:** Clarified that these two FLØW/ folders can hold permanent/living files (slow flow), while creative flows and agent flow remain transient (fast flow)
- **iCloud Desktop & Documents toggle guidance:** Explicit warning not to turn off yet at 98% disk capacity, explanation of what happens when toggled, phased approach
- **Migration gameplan added:** 6-phase safe migration order accounting for current 98% disk state and iCloud sync status
- **Code sync diagram:** Visual showing git push/pull flow between M4Pro, Mac Mini, and GitHub
- **Agent retrieval paths updated:** All iCloud paths now reference `FLØW/` parent (e.g., `FLØW/AGENT FLØW/inbox/`)
- **Signal flow diagram updated:** Reflects `FLØW/` namespace and Code Zone
- **Code Zone added to scaffolding:** `~/Code/` explicitly listed as a zone with its own rules

### v1.4 (February 2026)
- 3-device architecture introduced (M4Pro, Mac Mini, iPhone)
- Tier restructure from 3 to 4+1 (Workbench, River, Lake, Agent, Vault)
- iCloud Drive introduced as The River, Google Drive reaffirmed as The Lake
- Zones vs. Flows naming convention established
- MUSIC FLOW / IMAGE FLOW / VIDEO FLOW / AGENT FLOW introduced
- agent.iZØ Retrieve → Process → Export cycle documented
- iPhone → agent.iZØ command flow documented

### v1.3 (February 2026)
- 0 CORE full reorder, 1 VIBRATIONS full restructure, 4 AGENTIC consolidated
- 5 PAY THE DOLLS restructured, 6 ADVENTURES condensed, 7 PROJECTS redesigned
- 8 COLLABS full redesign, Ø branding applied across all folder names

### v1.2 (February 2026)
- Domain restructure — The Big Reshuffle
- VINYASA eliminated, all decade numbering shifted

### v1.1 (February 2026)
- Projects → Releases renamed, SSD Application Zones introduced
- Cross-zone flow model, TouchDesigner relocated
