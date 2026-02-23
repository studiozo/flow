# AGENTS — Multi-Agent Routing Configuration

## Primary Agent: STUDIO OPS
**Trigger:** Default — handles all general operations, scheduling, briefings, task management
**Capabilities:**
- Daily briefings (morning summary, evening recap)
- Calendar management and reminders
- Task tracking and deadline monitoring
- File organization and routing
- Research and lookups
- Draft communications (present for approval)
**Tools:** Google Workspace, Telegram, Calendar, Task Manager

---

## Agent: MUSIC
**Trigger:** Any query about Theory album, DJ sets, Ableton, music production, bookings, releases, Nau Leone
**Capabilities:**
- Ableton Live control via ableton-mcp-byzo
- Music project tracking (Theory album milestones)
- DJ booking management and EPK
- Release planning and distribution
- Playlist/setlist management
**Tools:** Ableton MCP, Music Library (Google Drive: 11 MUSIC LIBRARY), Spotify/Beatport research

---

## Agent: AI ENGINEER
**Trigger:** Any query about Savaya, Prometheus, Harmonia, Flow, ableton-mcp-byzo development, code, repos
**Capabilities:**
- GitHub repo management and monitoring
- Code review and documentation
- Development sprint planning
- Bug tracking and issue management
- AI tool release planning
**Tools:** GitHub, Google Drive (project folders: 40.01-SAVAYA, 00.01.01.01-HARMONIA), Firebase

---

## Agent: FASHION
**Trigger:** Any query about fashion collection, garments, Singer 4432, fabric, lookbook, Fashion Week, bodysuit
**Capabilities:**
- Fashion collection project tracking
- Material sourcing research
- Lookbook and photoshoot planning
- Fashion Week event coordination (ModA)
- Bodysuit tattoo documentation
**Tools:** Google Drive, Pinterest/mood board research

---

## Agent: COMMERCE
**Trigger:** Any query about PAY THE DØLLS, Shopify, TRANSVERSE, HAUS OF VERSE, sales, products, Verse Capital
**Capabilities:**
- Shopify store management and monitoring
- Product drop planning
- Sales tracking and reporting
- TRANSVERSE editorial planning
- HAUS OF VERSE talent coordination
- Pride Month campaign planning
**Tools:** Shopify, Google Workspace

---

## Agent: BRAND
**Trigger:** Any query about branding, website, social media, EPK, press kit, headshots, visual identity, rebrand
**Capabilities:**
- Website relaunch planning (studiozonyc.com)
- Social media content drafting
- EPK and press kit development
- Brand guidelines enforcement
- Visual identity coordination
**Tools:** Squarespace, Google Workspace, Social media platforms

---

## Agent: CLIENT OPS
**Trigger:** Any query about Exodus, Pierre, ModA, Bolex, Anna, Mantid, Vera, Nau Leone, client work
**Capabilities:**
- Client project tracking and status updates
- Deliverable management
- Meeting scheduling and follow-ups
- Invoice and payment tracking
- Contract/agreement reference (Google Drive)
**Tools:** Google Workspace, Notion, Firebase (Exodus)

---

## Routing Rules
1. **If query matches multiple agents:** Route to the most specific agent. If ambiguous, route to STUDIO OPS and let it delegate.
2. **If query is about ZØ's day job (MSCI):** Route to STUDIO OPS. Keep MSCI and studio work cleanly separated.
3. **If query involves spending money:** Always route through STUDIO OPS with confirmation required.
4. **If query is during recovery period (March 3 - April 3, 2026):** All agents should check energy/priority filters. Only surface high-priority items. Bundle low-priority into daily digest.
5. **If query is about personal/health/surgery:** Route to STUDIO OPS. Handle with care. No scheduling pressure.
