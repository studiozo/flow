const fs = require("fs");
const {
  Document, Packer, Paragraph, TextRun, Table, TableRow, TableCell,
  Header, Footer, AlignmentType, HeadingLevel, BorderStyle, WidthType,
  ShadingType, PageBreak, PageNumber, LevelFormat
} = require("docx");

// ── Colors ──
const DARK = "1A1A2E";
const ACCENT = "E94560";
const BLUE = "0F3460";
const LIGHT_BG = "F0F0F5";
const WHITE = "FFFFFF";
const GRAY = "666666";
const LIGHT_BORDER = "DDDDDD";

// ── Helpers ──
const border = { style: BorderStyle.SINGLE, size: 1, color: LIGHT_BORDER };
const borders = { top: border, bottom: border, left: border, right: border };
const noBorder = { style: BorderStyle.NONE, size: 0 };
const noBorders = { top: noBorder, bottom: noBorder, left: noBorder, right: noBorder };

const cellMargins = { top: 80, bottom: 80, left: 120, right: 120 };

function heading1(text) {
  return new Paragraph({
    heading: HeadingLevel.HEADING_1,
    spacing: { before: 360, after: 200 },
    children: [new TextRun({ text, bold: true, size: 32, font: "Arial", color: DARK })],
  });
}

function heading2(text) {
  return new Paragraph({
    heading: HeadingLevel.HEADING_2,
    spacing: { before: 280, after: 160 },
    children: [new TextRun({ text, bold: true, size: 26, font: "Arial", color: BLUE })],
  });
}

function heading3(text) {
  return new Paragraph({
    spacing: { before: 200, after: 120 },
    children: [new TextRun({ text, bold: true, size: 22, font: "Arial", color: ACCENT })],
  });
}

function para(text, opts = {}) {
  return new Paragraph({
    spacing: { after: 160 },
    children: [new TextRun({ text, size: 21, font: "Arial", color: opts.color || DARK, ...opts })],
  });
}

function paraRuns(runs) {
  return new Paragraph({
    spacing: { after: 160 },
    children: runs.map(r => new TextRun({ size: 21, font: "Arial", color: DARK, ...r })),
  });
}

function code(text) {
  return new Paragraph({
    spacing: { before: 80, after: 80 },
    indent: { left: 360 },
    shading: { fill: "F5F5F5", type: ShadingType.CLEAR },
    children: [new TextRun({ text, size: 19, font: "Courier New", color: DARK })],
  });
}

function codeBlock(lines) {
  return lines.map(line => code(line));
}

function bulletItem(text, opts = {}) {
  return new Paragraph({
    numbering: { reference: "bullets", level: opts.level || 0 },
    spacing: { after: 80 },
    children: Array.isArray(text)
      ? text.map(r => new TextRun({ size: 21, font: "Arial", color: DARK, ...r }))
      : [new TextRun({ text, size: 21, font: "Arial", color: DARK })],
  });
}

function numberItem(text, ref = "numbers") {
  return new Paragraph({
    numbering: { reference: ref, level: 0 },
    spacing: { after: 100 },
    children: Array.isArray(text)
      ? text.map(r => new TextRun({ size: 21, font: "Arial", color: DARK, ...r }))
      : [new TextRun({ text, size: 21, font: "Arial", color: DARK })],
  });
}

function warningBox(text) {
  const warnBorder = { style: BorderStyle.SINGLE, size: 2, color: ACCENT };
  return new Table({
    width: { size: 9360, type: WidthType.DXA },
    columnWidths: [9360],
    rows: [
      new TableRow({
        children: [
          new TableCell({
            borders: { top: warnBorder, bottom: warnBorder, left: { style: BorderStyle.SINGLE, size: 8, color: ACCENT }, right: warnBorder },
            shading: { fill: "FFF0F3", type: ShadingType.CLEAR },
            margins: { top: 120, bottom: 120, left: 200, right: 200 },
            width: { size: 9360, type: WidthType.DXA },
            children: [
              new Paragraph({
                children: [
                  new TextRun({ text: "WARNING: ", bold: true, size: 21, font: "Arial", color: ACCENT }),
                  new TextRun({ text, size: 21, font: "Arial", color: DARK }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}

function tipBox(text) {
  const tipBorder = { style: BorderStyle.SINGLE, size: 1, color: "4CAF50" };
  return new Table({
    width: { size: 9360, type: WidthType.DXA },
    columnWidths: [9360],
    rows: [
      new TableRow({
        children: [
          new TableCell({
            borders: { top: tipBorder, bottom: tipBorder, left: { style: BorderStyle.SINGLE, size: 8, color: "4CAF50" }, right: tipBorder },
            shading: { fill: "F0FFF0", type: ShadingType.CLEAR },
            margins: { top: 120, bottom: 120, left: 200, right: 200 },
            width: { size: 9360, type: WidthType.DXA },
            children: [
              new Paragraph({
                children: [
                  new TextRun({ text: "TIP: ", bold: true, size: 21, font: "Arial", color: "2E7D32" }),
                  new TextRun({ text, size: 21, font: "Arial", color: DARK }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}

function spacer() {
  return new Paragraph({ spacing: { after: 120 }, children: [] });
}

// ── Build Document ──
const doc = new Document({
  numbering: {
    config: [
      {
        reference: "bullets",
        levels: [
          { level: 0, format: LevelFormat.BULLET, text: "\u2022", alignment: AlignmentType.LEFT,
            style: { paragraph: { indent: { left: 720, hanging: 360 } } } },
          { level: 1, format: LevelFormat.BULLET, text: "\u25E6", alignment: AlignmentType.LEFT,
            style: { paragraph: { indent: { left: 1440, hanging: 360 } } } },
        ],
      },
      {
        reference: "numbers",
        levels: [
          { level: 0, format: LevelFormat.DECIMAL, text: "%1.", alignment: AlignmentType.LEFT,
            style: { paragraph: { indent: { left: 720, hanging: 360 } } } },
        ],
      },
      {
        reference: "steps",
        levels: [
          { level: 0, format: LevelFormat.DECIMAL, text: "Step %1.", alignment: AlignmentType.LEFT,
            style: { paragraph: { indent: { left: 720, hanging: 540 } } } },
        ],
      },
    ],
  },
  styles: {
    default: { document: { run: { font: "Arial", size: 21 } } },
    paragraphStyles: [
      { id: "Heading1", name: "Heading 1", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 32, bold: true, font: "Arial", color: DARK },
        paragraph: { spacing: { before: 360, after: 200 }, outlineLevel: 0 } },
      { id: "Heading2", name: "Heading 2", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 26, bold: true, font: "Arial", color: BLUE },
        paragraph: { spacing: { before: 280, after: 160 }, outlineLevel: 1 } },
    ],
  },
  sections: [
    // ═══ COVER / TITLE PAGE ═══
    {
      properties: {
        page: {
          size: { width: 12240, height: 15840 },
          margin: { top: 1440, right: 1440, bottom: 1440, left: 1440 },
        },
      },
      children: [
        spacer(), spacer(), spacer(), spacer(), spacer(),
        new Paragraph({
          alignment: AlignmentType.CENTER,
          spacing: { after: 200 },
          children: [new TextRun({ text: "CLAUDE CODE", size: 52, bold: true, font: "Arial", color: ACCENT })],
        }),
        new Paragraph({
          alignment: AlignmentType.CENTER,
          spacing: { after: 120 },
          children: [new TextRun({ text: "DOCKER AUTOPILOT", size: 44, bold: true, font: "Arial", color: DARK })],
        }),
        new Paragraph({
          alignment: AlignmentType.CENTER,
          spacing: { after: 400 },
          children: [new TextRun({ text: "SETUP GUIDE", size: 36, font: "Arial", color: BLUE })],
        }),
        new Paragraph({
          alignment: AlignmentType.CENTER,
          spacing: { after: 80 },
          children: [new TextRun({ text: "Official DevContainer Method", size: 24, font: "Arial", color: GRAY })],
        }),
        new Paragraph({
          alignment: AlignmentType.CENTER,
          spacing: { after: 80 },
          children: [new TextRun({ text: "Claude Max Subscription", size: 24, font: "Arial", color: GRAY })],
        }),
        new Paragraph({
          alignment: AlignmentType.CENTER,
          spacing: { after: 300 },
          children: [new TextRun({ text: "February 2026", size: 22, font: "Arial", color: GRAY })],
        }),
        spacer(), spacer(),
        new Table({
          width: { size: 9360, type: WidthType.DXA },
          columnWidths: [9360],
          rows: [
            new TableRow({
              children: [
                new TableCell({
                  borders: { top: noBorder, bottom: noBorder, left: noBorder, right: noBorder },
                  shading: { fill: LIGHT_BG, type: ShadingType.CLEAR },
                  margins: { top: 200, bottom: 200, left: 300, right: 300 },
                  width: { size: 9360, type: WidthType.DXA },
                  children: [
                    new Paragraph({
                      alignment: AlignmentType.CENTER,
                      children: [new TextRun({ text: "Run Claude Code unattended on big projects", size: 22, font: "Arial", color: BLUE, italics: true })],
                    }),
                    new Paragraph({
                      alignment: AlignmentType.CENTER,
                      children: [new TextRun({ text: "without approving every single bash command.", size: 22, font: "Arial", color: BLUE, italics: true })],
                    }),
                    new Paragraph({
                      alignment: AlignmentType.CENTER,
                      spacing: { before: 80 },
                      children: [new TextRun({ text: "Safely.", size: 24, bold: true, font: "Arial", color: ACCENT })],
                    }),
                  ],
                }),
              ],
            }),
          ],
        }),
        new Paragraph({ children: [new PageBreak()] }),

        // ═══ WHAT YOU NEED (PREREQUISITES) ═══
        heading1("What You Need Before Starting"),
        spacer(),

        heading3("Required Software"),

        bulletItem([
          { text: "Docker Desktop ", bold: true },
          { text: "installed and running on your Mac" },
        ]),
        bulletItem([
          { text: "VS Code ", bold: true },
          { text: "or " },
          { text: "Cursor ", bold: true },
          { text: "(both work \u2014 Cursor is VS Code under the hood)" },
        ]),
        bulletItem([
          { text: "Dev Containers extension ", bold: true },
          { text: "installed in VS Code/Cursor" },
        ]),
        bulletItem([
          { text: "Git ", bold: true },
          { text: "installed (comes with macOS Xcode tools)" },
        ]),
        spacer(),

        heading3("Required Account"),

        bulletItem([
          { text: "Claude Max subscription ", bold: true },
          { text: "\u2014 you\u2019ll log in with OAuth inside the container" },
        ]),
        spacer(),

        tipBox("Your Claude Max subscription works with Claude Code CLI. You do NOT need a separate API key for this setup."),
        spacer(),

        new Paragraph({ children: [new PageBreak()] }),

        // ═══ STEP 1: Install Docker Desktop ═══
        heading1("Step 1: Install Docker Desktop"),
        spacer(),

        para("If you already have Docker running, skip to Step 2."),
        spacer(),

        numberItem([
          { text: "Download Docker Desktop from " },
          { text: "docker.com/products/docker-desktop", bold: true, color: BLUE },
        ]),
        numberItem("Run the installer and follow the prompts"),
        numberItem("Open Docker Desktop and wait for the whale icon to appear in your menu bar"),
        numberItem("Verify it works by opening Terminal and running:"),
        spacer(),
        code("docker --version"),
        spacer(),

        para("You should see something like: Docker version 27.x.x"),
        spacer(),

        new Paragraph({ children: [new PageBreak()] }),

        // ═══ STEP 2: Install Dev Containers Extension ═══
        heading1("Step 2: Install the Dev Containers Extension"),
        spacer(),

        numberItem("Open VS Code or Cursor"),
        numberItem([
          { text: "Go to Extensions (Cmd+Shift+X)" },
        ]),
        numberItem([
          { text: "Search for " },
          { text: "Dev Containers", bold: true },
        ]),
        numberItem([
          { text: "Install the extension by Microsoft (ID: " },
          { text: "ms-vscode-remote.remote-containers", bold: true, font: "Courier New", size: 19 },
          { text: ")" },
        ]),
        spacer(),

        tipBox("In Cursor, the Extensions marketplace is the same as VS Code. Dev Containers works identically in both."),
        spacer(),

        new Paragraph({ children: [new PageBreak()] }),

        // ═══ STEP 3: Clone the DevContainer ═══
        heading1("Step 3: Clone the Official DevContainer"),
        spacer(),

        para("Open your terminal and run these commands:"),
        spacer(),

        ...codeBlock([
          "# Clone the official Claude Code repository",
          "git clone https://github.com/anthropics/claude-code.git",
          "",
          "# Navigate into the repo",
          "cd claude-code",
        ]),
        spacer(),

        para("This repo contains the .devcontainer folder with three critical files:"),
        spacer(),

        bulletItem([
          { text: "devcontainer.json", bold: true, font: "Courier New", size: 19 },
          { text: " \u2014 container settings, extensions, volume mounts" },
        ]),
        bulletItem([
          { text: "Dockerfile", bold: true, font: "Courier New", size: 19 },
          { text: " \u2014 the container image (Node 20, dev tools, Claude Code CLI)" },
        ]),
        bulletItem([
          { text: "init-firewall.sh", bold: true, font: "Courier New", size: 19 },
          { text: " \u2014 network security rules (whitelists only npm, GitHub, Claude API)" },
        ]),
        spacer(),

        new Paragraph({ children: [new PageBreak()] }),

        // ═══ STEP 4: Open in Container ═══
        heading1("Step 4: Open the Project in the Container"),
        spacer(),

        numberItem([
          { text: "Open the " },
          { text: "claude-code", bold: true, font: "Courier New", size: 19 },
          { text: " folder in VS Code or Cursor" },
        ]),
        numberItem([
          { text: "VS Code/Cursor will detect the " },
          { text: ".devcontainer", font: "Courier New", size: 19 },
          { text: " folder and prompt:" },
        ]),
        spacer(),

        new Table({
          width: { size: 9360, type: WidthType.DXA },
          columnWidths: [9360],
          rows: [
            new TableRow({
              children: [
                new TableCell({
                  borders,
                  shading: { fill: LIGHT_BG, type: ShadingType.CLEAR },
                  margins: { top: 120, bottom: 120, left: 200, right: 200 },
                  width: { size: 9360, type: WidthType.DXA },
                  children: [
                    new Paragraph({
                      alignment: AlignmentType.CENTER,
                      children: [new TextRun({ text: '"Folder contains a Dev Container config. Reopen in Container?"', italics: true, size: 21, font: "Arial", color: DARK })],
                    }),
                  ],
                }),
              ],
            }),
          ],
        }),
        spacer(),

        numberItem([
          { text: 'Click ', },
          { text: '"Reopen in Container"', bold: true },
        ]),
        spacer(),

        para("Or manually: open Command Palette (Cmd+Shift+P) and type:"),
        code("Remote-Containers: Reopen in Container"),
        spacer(),

        warningBox("First build takes 3\u20135 minutes. Docker downloads the Node 20 image, installs tools, configures the firewall, and installs Claude Code CLI. Subsequent opens are much faster (cached)."),
        spacer(),

        new Paragraph({ children: [new PageBreak()] }),

        // ═══ STEP 5: Authenticate ═══
        heading1("Step 5: Authenticate with Claude Max"),
        spacer(),

        para("Once the container is running, open the integrated terminal inside VS Code/Cursor."),
        spacer(),

        numberItem("In the terminal, run:"),
        spacer(),
        code("claude"),
        spacer(),

        numberItem("Claude Code will start and prompt you to log in"),
        numberItem([
          { text: "Select " },
          { text: "Login with browser", bold: true },
          { text: " (OAuth)" },
        ]),
        numberItem("A URL will appear \u2014 open it in your browser"),
        numberItem("Log in with your Anthropic account (the one with Max)"),
        numberItem("Authorize the connection"),
        numberItem([
          { text: "Back in the terminal, you should see " },
          { text: "Claude Code is ready", bold: true, color: "4CAF50" },
        ]),
        spacer(),

        tipBox("Your auth token persists between container restarts because the devcontainer mounts a volume for /home/node/.claude. You only need to log in once."),
        spacer(),

        new Paragraph({ children: [new PageBreak()] }),

        // ═══ STEP 6: Run Autopilot ═══
        heading1("Step 6: Run in Autopilot Mode"),
        spacer(),

        para("Now you\u2019re inside an isolated container with firewall rules. This is where you can safely use the autopilot flag."),
        spacer(),

        heading3("Option A: Interactive YOLO Mode"),
        para("Start Claude Code with all permissions bypassed:"),
        spacer(),
        code("claude --dangerously-skip-permissions"),
        spacer(),
        para("Then type your task and let it run. No permission prompts will appear."),
        spacer(),

        heading3("Option B: Headless Mode (fire and forget)"),
        para("Give it a task directly from the command line:"),
        spacer(),
        ...codeBlock([
          'claude -p "Refactor all Python files to use type hints" \\',
          "  --dangerously-skip-permissions",
        ]),
        spacer(),

        heading3("Option C: Headless with JSON Output (for scripting)"),
        spacer(),
        ...codeBlock([
          'claude -p "Run all tests and fix failures" \\',
          "  --dangerously-skip-permissions \\",
          "  --output-format json",
        ]),
        spacer(),

        heading3("Option D: Loop Through Multiple Tasks"),
        spacer(),
        ...codeBlock([
          "# Process files one by one",
          'for file in src/*.py; do',
          '  claude -p "Add docstrings to $file" \\',
          "    --dangerously-skip-permissions",
          "done",
        ]),
        spacer(),

        new Paragraph({ children: [new PageBreak()] }),

        // ═══ WHY THIS IS SAFE ═══
        heading1("Why This Is Safe Inside the Container"),
        spacer(),

        para("The devcontainer provides three layers of protection:"),
        spacer(),

        heading3("1. Filesystem Isolation"),
        para("Claude can only access /workspace (your mounted project). Your home directory, system files, SSH keys, and other projects are not visible inside the container."),
        spacer(),

        heading3("2. Network Firewall"),
        para("The init-firewall.sh script creates a default-deny firewall that only allows connections to:"),
        spacer(),
        bulletItem("registry.npmjs.org (installing npm packages)"),
        bulletItem("GitHub (git operations, API)"),
        bulletItem("api.anthropic.com (Claude API calls)"),
        bulletItem("sentry.io / statsig.anthropic.com (telemetry)"),
        bulletItem("VS Code marketplace (extensions)"),
        spacer(),
        para("Everything else is blocked. If Claude gets tricked by a prompt injection into running curl to exfiltrate your code, the firewall blocks it."),
        spacer(),

        heading3("3. Non-Root Execution"),
        para("Claude runs as user \u201Cnode\u201D (UID 1001), not root. It cannot modify system files, install system packages, or change firewall rules. The only sudo permission granted is running the firewall initialization script."),
        spacer(),

        warningBox("The devcontainer does NOT protect against exfiltration to the whitelisted domains. If you\u2019re working with a malicious repository that contains prompt injections, those could theoretically send data to GitHub or npm. Only use with trusted code."),
        spacer(),

        new Paragraph({ children: [new PageBreak()] }),

        // ═══ MOUNTING YOUR OWN PROJECT ═══
        heading1("Using Your Own Project (Not the Claude Code Repo)"),
        spacer(),

        para("You probably don\u2019t want to work inside the claude-code repo itself. Here\u2019s how to use the devcontainer with your own project:"),
        spacer(),

        heading3("Method 1: Copy the .devcontainer folder"),
        spacer(),
        numberItem("Copy the .devcontainer folder from claude-code into your project:"),
        spacer(),
        ...codeBlock([
          "cp -r claude-code/.devcontainer /path/to/your/project/",
        ]),
        spacer(),
        numberItem("Open your project in VS Code/Cursor"),
        numberItem([
          { text: 'Click "Reopen in Container" when prompted' },
        ]),
        spacer(),

        heading3("Method 2: Use --workspace-folder flag"),
        spacer(),
        para("If using the devcontainer CLI directly:"),
        spacer(),
        ...codeBlock([
          "npm install -g @devcontainers/cli",
          "",
          "devcontainer up --workspace-folder /path/to/your/project",
        ]),
        spacer(),

        tipBox("Your project files are mounted at /workspace inside the container. Changes made inside the container are reflected on your real filesystem. Git commits made inside the container appear in your normal git history."),
        spacer(),

        new Paragraph({ children: [new PageBreak()] }),

        // ═══ ALTERNATIVE: Fine-Grained Permissions ═══
        heading1("Alternative: Skip Docker, Use Fine-Grained Permissions"),
        spacer(),

        para("If Docker feels like overkill, you can get 90% of the autopilot experience by pre-approving specific commands. No container needed."),
        spacer(),

        heading3("Create .claude/settings.json in your project:"),
        spacer(),
        ...codeBlock([
          "{",
          '  "permissions": {',
          '    "allow": [',
          '      "Bash(npm run *)",',
          '      "Bash(npx *)",',
          '      "Bash(git status *)",',
          '      "Bash(git add *)",',
          '      "Bash(git commit *)",',
          '      "Bash(git diff *)",',
          '      "Bash(python *)",',
          '      "Bash(pip install *)",',
          '      "Bash(mkdir *)",',
          '      "Bash(ls *)",',
          '      "Read(**)",',
          '      "Edit(**)"',
          "    ],",
          '    "deny": [',
          '      "Bash(rm -rf *)",',
          '      "Bash(curl *)",',
          '      "Bash(wget *)",',
          '      "Bash(sudo *)",',
          '      "Read(.env*)",',
          '      "Read(secrets/**)"',
          "    ]",
          "  }",
          "}",
        ]),
        spacer(),

        para("Then run Claude Code normally. It will auto-approve any command matching your allow list, auto-deny anything in your deny list, and only prompt for everything else."),
        spacer(),

        warningBox("There is a known bug where --allowedTools may be ignored in bypass mode. Use --disallowedTools instead to block specific tools, which works reliably."),
        spacer(),

        new Paragraph({ children: [new PageBreak()] }),

        // ═══ QUICK REFERENCE ═══
        heading1("Quick Reference"),
        spacer(),

        heading3("Permission Modes"),
        spacer(),

        new Table({
          width: { size: 9360, type: WidthType.DXA },
          columnWidths: [2200, 3800, 3360],
          rows: [
            new TableRow({
              children: ["Mode", "What It Does", "When to Use"].map(text =>
                new TableCell({
                  borders,
                  shading: { fill: BLUE, type: ShadingType.CLEAR },
                  margins: cellMargins,
                  width: { size: 2200, type: WidthType.DXA },
                  children: [new Paragraph({ children: [new TextRun({ text, bold: true, size: 20, font: "Arial", color: WHITE })] })],
                })
              ),
            }),
            ...([
              ["default", "Prompts on first use of each tool", "Normal interactive work"],
              ["acceptEdits", "Auto-approves file edits, prompts for bash", "Editing-heavy workflows"],
              ["plan", "Read-only; no edits or bash", "Safe analysis mode"],
              ["dontAsk", "Auto-denies unless pre-approved", "Strict control"],
              ["bypassPermissions", "Skips ALL prompts (YOLO)", "Only in containers/VMs"],
            ]).map((row, i) =>
              new TableRow({
                children: row.map((text, j) =>
                  new TableCell({
                    borders,
                    shading: { fill: i % 2 === 0 ? LIGHT_BG : WHITE, type: ShadingType.CLEAR },
                    margins: cellMargins,
                    width: { size: [2200, 3800, 3360][j], type: WidthType.DXA },
                    children: [new Paragraph({ children: [new TextRun({ text, size: 20, font: j === 0 ? "Courier New" : "Arial", color: DARK, bold: j === 0 })] })],
                  })
                ),
              })
            ),
          ],
        }),
        spacer(), spacer(),

        heading3("Essential Commands"),
        spacer(),

        ...codeBlock([
          "# Interactive autopilot (inside container)",
          "claude --dangerously-skip-permissions",
          "",
          "# Headless single task",
          'claude -p "your task" --dangerously-skip-permissions',
          "",
          "# Headless with JSON output",
          'claude -p "your task" --dangerously-skip-permissions --output-format json',
          "",
          "# Resume last session",
          "claude --continue --dangerously-skip-permissions",
          "",
          "# Resume specific session",
          "claude --resume SESSION_ID --dangerously-skip-permissions",
        ]),
        spacer(), spacer(),

        heading3("Useful Flags"),
        spacer(),

        new Table({
          width: { size: 9360, type: WidthType.DXA },
          columnWidths: [3600, 5760],
          rows: [
            new TableRow({
              children: ["Flag", "Purpose"].map((text, j) =>
                new TableCell({
                  borders,
                  shading: { fill: BLUE, type: ShadingType.CLEAR },
                  margins: cellMargins,
                  width: { size: [3600, 5760][j], type: WidthType.DXA },
                  children: [new Paragraph({ children: [new TextRun({ text, bold: true, size: 20, font: "Arial", color: WHITE })] })],
                })
              ),
            }),
            ...([
              ["-p \"prompt\"", "Run non-interactively"],
              ["--output-format json", "Machine-parseable output"],
              ["--continue", "Resume last session"],
              ["--resume <id>", "Resume specific session"],
              ["--allowedTools", "Pre-approve tools (may have bugs)"],
              ["--disallowedTools", "Block specific tools (reliable)"],
              ["--max-turns N", "Limit agentic turns"],
            ]).map((row, i) =>
              new TableRow({
                children: row.map((text, j) =>
                  new TableCell({
                    borders,
                    shading: { fill: i % 2 === 0 ? LIGHT_BG : WHITE, type: ShadingType.CLEAR },
                    margins: cellMargins,
                    width: { size: [3600, 5760][j], type: WidthType.DXA },
                    children: [new Paragraph({ children: [new TextRun({ text, size: 20, font: j === 0 ? "Courier New" : "Arial", color: DARK })] })],
                  })
                ),
              })
            ),
          ],
        }),
        spacer(), spacer(),

        // ═══ TL;DR ═══
        new Paragraph({ children: [new PageBreak()] }),
        heading1("TL;DR \u2014 The 5 Minute Version"),
        spacer(),

        new Table({
          width: { size: 9360, type: WidthType.DXA },
          columnWidths: [9360],
          rows: [
            new TableRow({
              children: [
                new TableCell({
                  borders: { top: noBorder, bottom: noBorder, left: { style: BorderStyle.SINGLE, size: 8, color: BLUE }, right: noBorder },
                  shading: { fill: "EDF4FC", type: ShadingType.CLEAR },
                  margins: { top: 200, bottom: 200, left: 300, right: 300 },
                  width: { size: 9360, type: WidthType.DXA },
                  children: [
                    new Paragraph({ spacing: { after: 100 }, children: [new TextRun({ text: "1.  Install Docker Desktop + Dev Containers extension", size: 22, font: "Arial", color: DARK })] }),
                    new Paragraph({ spacing: { after: 100 }, children: [new TextRun({ text: "2.  git clone https://github.com/anthropics/claude-code.git", size: 22, font: "Courier New", color: DARK })] }),
                    new Paragraph({ spacing: { after: 100 }, children: [new TextRun({ text: "3.  Open folder in VS Code/Cursor", size: 22, font: "Arial", color: DARK })] }),
                    new Paragraph({ spacing: { after: 100 }, children: [new TextRun({ text: '4.  Click "Reopen in Container"', size: 22, font: "Arial", color: DARK })] }),
                    new Paragraph({ spacing: { after: 100 }, children: [new TextRun({ text: "5.  Run: claude --dangerously-skip-permissions", size: 22, font: "Courier New", color: DARK })] }),
                    new Paragraph({ spacing: { after: 100 }, children: [new TextRun({ text: "6.  Log in with your Claude Max account", size: 22, font: "Arial", color: DARK })] }),
                    new Paragraph({ children: [new TextRun({ text: "7.  Hand it your project. Go grab coffee.", size: 22, font: "Arial", color: DARK, bold: true })] }),
                  ],
                }),
              ],
            }),
          ],
        }),
      ],
    },
  ],
});

// ── Save ──
Packer.toBuffer(doc).then(buffer => {
  fs.writeFileSync("/sessions/confident-gifted-volta/mnt/_claude/Claude-Code-Docker-Autopilot-Setup.docx", buffer);
  console.log("Document created successfully!");
});
