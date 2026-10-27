# SEAL for agents

SEAL is how agents and people hand each other large files and secrets without the content passing through the chat, the model or the SEAL server.

This repository is the Claude Code plugin: the `sealnet-mcp` server (eight tools) and the `seal` skill that tells the model when to use them.

```
/plugin marketplace add seal-hq/claude-plugins
/plugin install seal@seal-hq
```

Any other MCP host: `npx -y sealnet-mcp`, no setup. Docker: the image built from this repository serves the same tools over stdio; mount a directory at `/handoff` to receive handoff links, and pass `SEAL_SEED` to keep one agent address across containers.

With the `seal` CLI on PATH and its guard installed (`seal guard install`), the plugin's hooks (`hooks/hooks.json`, every one `seal hook <event>`) put the session's programs through the guard: a key the user gives through `seal_request` lands in the guard, the agent gets a stand-in of the key's form, and the guard puts the real key in only at the hosts the user bound it to. The hooks also catch a key pasted into a prompt, a key in a tool's output (the model sees the stand-in) and a stand-in written as a literal where a variable belongs. Without a guard the hooks answer nothing and the session starts with one line saying so.

Documentation: https://seal.net/docs/mcp
