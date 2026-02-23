# Social Media Poster

## Description
Create and schedule social media posts across platforms for ZØ Studio.

## Triggers
- "post to instagram", "schedule a post", "create content", "social media"
- "post this to [platform]", "draft a caption"

## Supported Platforms
- Instagram (via Meta Graph API)
- TikTok (via TikTok API)
- Twitter/X (via browser automation as fallback)

## Workflow

### Draft Mode (Default)
1. Generate caption with ZØ brand voice (clean, modern, premium)
2. Suggest hashtags (mix of branded #ZOStudio + trending relevant tags)
3. Recommend optimal posting time based on platform
4. Present draft for approval
5. Only post AFTER explicit human confirmation

### Scheduled Mode
1. Accept content + target date/time
2. Queue in memory/scheduled-posts.md
3. Post at scheduled time
4. Confirm delivery with screenshot

## Brand Voice Rules
- Clean, minimal copy. No emoji overload.
- Hashtags: max 10 on Instagram, 3-5 on TikTok
- Always include #ZOStudio or #StudioZONYC
- Tone: confident, creative, future-forward

## Safety
- ALL posts require human approval before publishing
- Never post controversial or off-brand content
- Never engage in comment wars or respond to trolls
- Screenshot every post for records in memory/post-log/
