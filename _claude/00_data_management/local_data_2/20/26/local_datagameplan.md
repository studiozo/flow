# LOCAL DATA GAMEPLAN — Desktop + SSD Cleanup

> **Session start:** 2026-02-20
> **Previous work:** Google Drive migration COMPLETE (all 10 decades, 97 folders, 11 legacy folders deleted)
> **This session:** Auditing & mapping Desktop cleanup

---

## SESSION LOG — 2026-02-20

### What We Did

1. **Audited the full Desktop** — inventoried all 12 folders + 17 loose files
2. **Discovered iZØ.IØ + z-pack are NOT on Desktop** — they're at `~/Music/` (correct local zone already)
3. **Investigated rekordbox on Google Drive** — found it's Cloud Library sync data (should not be there)
4. **Built the Desktop Routing Map** — 11 phases, 133+ items → saved to `maps/03-desktop-routing-map.md`
5. **Identified 8 user decisions** needed before full execution

### Key Findings

- **Disk:** 48% used, 18GB free (was 95% / 1GB when we started the Drive migration)
- **Desktop total:** ~63GB in folders + ~15.7GB loose files
- **Biggest quick win:** Delete `PLUGINS MAC M4.zip` = **15.5GB freed instantly**
- **Biggest item:** `01 ZØ MUSIC/` at 52GB (but most of the heavy stuff — iZØ.IØ 129GB, z-pack 46GB — is actually at `~/Music/`, not Desktop)

---

## GOOGLE DRIVE — REMAINING LOOSE ENDS

### 11 Virtual Google Files at Drive Root (manual move via drive.google.com)

| File | Destination | Done? |
|------|-------------|-------|
| `1381 Cover Letter.gdoc` | `0 CØRE/07 ADMIN/` | ☐ |
| `CREATE THAT ASA GOOGLE DOC KNOWLEDGE BASE.gsheet` | `4 AGENTIC/43 DØCS + SPECS/` | ☐ |
| `ModA x Bolex - v2 quick rewrite.gdoc` | `8 CØLLABS/83 PRØPØSALS/` | ☐ |
| `Portfolio.gsite` | `0 CØRE/03 WEBSITE/` | ☐ |
| `Sketchy Stage X Bolex Studios.gslides` | `8 CØLLABS/83 PRØPØSALS/` | ☐ |
| `Stardust Plaque Proof.gdoc` | `7 PRØJECTS/76 ARCHIVE/` | ☐ |
| `Zoe Lease Application.gdoc` | `0 CØRE/07 ADMIN/` | ☐ |
| `if im in in key a Minor.gsheet` | `1 VIBRATIØNS/18 VIBES LEARNING/` | ☐ |
| `Master Rebuild Guide.gsheet` | `7 PRØJECTS/71 ACTIVE/` | ☐ |
| `Sample Pack Rebuild Master Guide.gsheet` | `1 VIBRATIØNS/13 SAMPLES/` | ☐ |
| `Untitled video.gvid` | `0 CØRE/08 IMPØRTS/` | ☐ |

### `07 AI STUDIØ/` still exists on Drive — should be fully deleted

### `rekordbox/` on Drive — CLOUD SYNC ARTIFACT (details below)

---

## REKORDBOX ON GOOGLE DRIVE — INVESTIGATION NOTES

**Path:** `~/Library/CloudStorage/GoogleDrive-zo@studiozonyc.com/My Drive/rekordbox/`

**What it is:** Rekordbox Cloud Library sync data. Auto-created by rekordbox's cloud sync feature.

**Contents:**
- `contents_1111247067/` — **73 artist folders** (&me black coffee, above & beyond, argy, charlotte de witte, anyma, booka shade, eli & fur, etc.)
- `contents_2280630577/` — **121 artist folders** (ace ventura, adriatique, anyma, artbat, ben böhmer, black coffee, etc.)

**Recommendation:** DELETE from Drive. Rekordbox = always local SSD per spec. Turn off rekordbox cloud sync first so it doesn't re-create. Your real library lives locally.

---

## iZØ.IØ + z-pack — LOCATION CLARIFICATION

**NOT on Desktop.** Both live at `~/Music/` which is the correct local Music zone per the Decimal System spec.

| Item | Path | Size | Status |
|------|------|------|--------|
| `iZØ.IØ` | `~/Music/iZØ.IØ/` | 129GB | ✅ Correct location. DON'T MOVE. Already mirrored on Drive at `1 VIBRATIØNS/13 SAMPLES/iZØ.IØ/` |
| `z-pack` | `~/Music/z-pack/` | 46GB | ✅ Correct location. Remnants of iZØ.IØ — needs dedup audit. |

### z-pack Contents (remnants of iZØ.IØ)

| Folder | Size | Notes |
|--------|------|-------|
| `SAMPLES/` | **34GB** | Shamanic wheel folders — 09-fire (12G), 03-tribe (8.2G), 04-water (7.5G), 02-earth (3.9G), 07-shadow (2.3G), 00-void (441M). 05-heart, 06-body, 08-cosmos nearly empty. |
| `ZØxTPS/` | **7.6GB** | Unknown — needs investigation |
| `MIDI/` | 3GB | MIDI files |
| `IMPORTS/` | 581MB | Unsorted imports |
| `VST-PRESETS/` | 505MB | Partially mirrored to Drive (`13.01.01-VST PRESETS`) |
| `zo_music_agents/` | 49MB | Agent configs |
| `zARCHIVE/` | 25MB | Old stuff |
| `PLUGINS/` | 0B | Empty |
| Config files | small | `Z-music-taxonomy.md`, `shamanickey_summary.md`, `_ZO-LIBRARY-GUIDE.txt`, Python reorganize scripts, `Sample Pack Rebuild Master Guide.xlsx`, `OP-XY.guide.pdf` |

**Next step for z-pack:** Compare SAMPLES/ folders against iZØ.IØ/SAMPLES/ to find what's unique vs. duplicate. Anything unique gets merged into iZØ.IØ, dupes get deleted. Could free up to 34GB.

---

## DESKTOP ROUTING MAP — PHASE SUMMARY

Full map at: `maps/03-desktop-routing-map.md`

| Phase | What | Est. Size | Status |
|-------|------|-----------|--------|
| D1 | Quick Wins — delete junk | **15.5GB freed** | ☐ PENDING |
| D2 | Admin docs → Drive | 19MB | ☐ PENDING |
| D3 | Designs → Drive | 215MB | ☐ PENDING |
| D4 | Videos → Drive | 58MB | ☐ PENDING |
| D5 | Projects (MSCI 8GB) → Drive | 8.8GB | ☐ PENDING |
| D6 | AI Studio → Drive + Local | 369MB | ☐ PENDING |
| D7 | Downloads → triage | varies | ☐ PENDING |
| D8 | Master Pieces / SØUNDBATH → Drive | 1.6GB | ☐ PENDING |
| D9 | Plugin installers → Drive/Delete | ~88KB | ☐ PENDING |
| D10 | Music folders → Drive + Local | 52GB+ | ☐ PENDING — needs dedup audit |
| D11 | Loose files → various | ~430MB | ☐ PENDING |

---

## USER DECISIONS — OPEN

| # | Question | Answer |
|---|----------|--------|
| 1 | `iZØ.IØ` (129GB) — what is it? | ✅ Sample library. DON'T MOVE. Already at ~/Music/. |
| 2 | `z-pack` (46GB) — what is it? | ✅ Remnants of iZØ.IØ. Needs dedup audit. At ~/Music/. |
| 3 | Plugin DMGs — archive or delete? | ☐ OPEN |
| 4 | `FallbackPDF.pdf` (13MB) — keep? | ☐ OPEN |
| 5 | Screen Recording, Untitled 2.mov, video.mov — keep? | ☐ OPEN |
| 6 | `qore.zip` — what is it? | ☐ OPEN |
| 7 | Keygen/crack files — still needed? | ☐ OPEN |
| 8 | `rekordbox/` on Drive — delete? | ☐ OPEN (recommended: YES, turn off cloud sync first) |

---

## FILES CREATED THIS SESSION

| File | Location |
|------|----------|
| Desktop Routing Map | `00_data_integrations/maps/03-desktop-routing-map.md` |
| This gameplan | `local_data_2/20/26/local_datagameplan.md` |

---

## HOW TO RESUME NEXT SESSION

1. Read this file first
2. Check `maps/03-desktop-routing-map.md` for the full routing plan
3. Get remaining user decisions (items 3-8 above)
4. Start executing Phase D1 (quick wins)
5. Work through phases D2-D11 in order
6. After Desktop is clear: audit z-pack vs iZØ.IØ for dedup
7. Move 11 virtual Google files via drive.google.com
8. Delete rekordbox/ from Drive (after disabling cloud sync)
