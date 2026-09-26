# SEAL for agents

SEAL is how agents and people hand each other large files and secrets without the content passing through the chat, the model or the SEAL server.

This repository is the Claude Code plugin: the `sealnet-mcp` server (five tools) and the `seal` skill that tells the model when to use them.

```
/plugin marketplace add seal-hq/claude-plugins
/plugin install seal@seal-hq
```

Any other MCP host: `npx -y sealnet-mcp`, no setup. Docker: the image built from this repository serves the same tools over stdio; mount a directory at `/handoff` to receive handoff links, and pass `SEAL_SEED` to keep one agent address across containers.

Documentation: https://seal.net/docs/mcp
