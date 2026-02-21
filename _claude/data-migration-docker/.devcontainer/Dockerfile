FROM node:20-slim

ARG TZ
ENV TZ="${TZ:-America/New_York}"

ARG CLAUDE_CODE_VERSION=latest

# Install file management tools (no dev bloat)
RUN apt-get update && apt-get install -y --no-install-recommends \
  tree \
  file \
  rename \
  rsync \
  less \
  git \
  sudo \
  zsh \
  fzf \
  jq \
  nano \
  wget \
  ca-certificates \
  procps \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Give node user passwordless sudo
RUN echo "node ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/node && \
  chmod 0440 /etc/sudoers.d/node

# Set up directories (as root, before switching to node)
RUN mkdir -p /workspace /gdrive /home/node/.claude /usr/local/share/npm-global /commandhistory && \
  chown -R node:node /workspace /gdrive /home/node/.claude /usr/local/share/npm-global /commandhistory && \
  touch /commandhistory/.bash_history && \
  chown node /commandhistory/.bash_history

ENV DEVCONTAINER=true
WORKDIR /workspace

# Switch to node user for Claude Code install
USER node

ENV NPM_CONFIG_PREFIX=/usr/local/share/npm-global
ENV PATH=$PATH:/usr/local/share/npm-global/bin

# Install Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION}

# Set zsh as default shell
ENV SHELL=/bin/zsh
ENV EDITOR=nano
ENV VISUAL=nano

# Minimal zsh setup
ARG ZSH_IN_DOCKER_VERSION=1.2.0
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v${ZSH_IN_DOCKER_VERSION}/zsh-in-docker.sh)" -- \
  -p git \
  -p fzf \
  -a "export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
  -a "alias yolo='claude --dangerously-skip-permissions'" \
  -a "alias resume='claude --dangerously-skip-permissions --continue'" \
  -x
