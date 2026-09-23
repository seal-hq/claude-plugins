# The image the Docker MCP Catalog builds from this repository
# (SPEC-AGENTS 7.7): the npm package, served over stdio. A container has no
# clipboard and no keychain, so the server runs ephemeral and a handoff link
# lands in the file channel under /handoff: mount a host directory there to
# read it. Forward links, requests and opening links need nothing mounted.
FROM node:22-slim
RUN npm install -g sealnet-mcp && npm cache clean --force \
 && mkdir -m 700 /handoff && chown node:node /handoff
ENV XDG_RUNTIME_DIR=/handoff
USER node
ENTRYPOINT ["sealnet-mcp", "serve"]
