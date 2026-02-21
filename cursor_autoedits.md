1. Auto-accept edits: ~/.claude/settings.json
This is what gives you the "YOLO mode" — it auto-accepts all file reads, writes, edits, and bash commands without prompting:


{
  "permissions": {
    "allow": [
      "Bash(*)",
      "Read",
      "Write",
      "Edit"
    ],
    "deny": [
      "Bash(rm -rf *)",
      "Bash(rm -r *)",
      "Bash(sudo *)",
      "Bash(chmod *)",
      "Bash(chown *)"
    ]
  }
}
The allow list auto-accepts everything. The deny list blocks destructive commands as a safety net.

2. Custom keybindings: ~/.claude/keybindings.json

{
  "bindings": [
    {
      "context": "Global",
      "bindings": {
        "ctrl+k ctrl+t": "app:toggleTodos",
        "ctrl+k ctrl+s": "app:toggleTranscript"
      }
    },
    {
      "context": "Chat",
      "bindings": {
        "alt+enter": "chat:submit",
        "ctrl+e": "chat:externalEditor"
      }
    }
  ]
}
To replicate on your Mac Mini:
Install Claude Code: npm install -g @anthropic-ai/claude-code
Create the config dir: mkdir -p ~/.claude
Copy those two files into ~/.claude/ on the Mac Mini:
~/.claude/settings.json
~/.claude/keybindings.json
That's it — once those two files are in place, Claude Code will auto-accept all edits with the same safety guardrails. Want me to generate a quick copy command you can run from the Mac Mini?