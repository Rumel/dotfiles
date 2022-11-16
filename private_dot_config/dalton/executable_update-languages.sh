#!/usr/bin/env bash

set -v

log() {
  printf "\033[0;32m%s\033[0m\n" "$1"
}

asdf plugin add awscli || true 
asdf plugin add clojure || true 
asdf plugin add dotnet || true
asdf plugin add elixir || true
asdf plugin add erlang || true
asdf plugin add golang || true
asdf plugin add java || true
asdf plugin add kubectl || true
asdf plugin add nodejs || true
asdf plugin add python || true
asdf plugin add ruby || true
asdf plugin add rust || true
asdf plugin add yarn || true

log "Updating AWS CLI"
asdf install awscli latest
asdf global awscli latest

JAVA_VERSION=$(asdf list all java | grep corretto | tail -n 1)
log "Updating Java with $JAVA_VERSION"
asdf install java "$JAVA_VERSION"
asdf global java "$JAVA_VERSION"

log "Updating clojure"
asdf install clojure latest
asdf global clojure latest

log "Updating dotnet"
asdf install dotnet latest
asdf global dotnet latest

log "Updating golang"
asdf install golang latest
asdf global golang latest

log "Updating kubectl"
asdf install kubectl latest
asdf global kubectl latest

log "Updating nodejs"
asdf install nodejs lts
asdf install nodejs latest
asdf global nodejs latest lts

log "Updating python"
asdf install python latest
asdf global python latest

log "Updating ruby"
asdf install ruby latest
asdf global ruby latest

log "Updating rust"
asdf install rust latest
asdf global rust latest

log "Updating yarn"
asdf install yarn latest
asdf global yarn latest

# log "Updating erlang"
# asdf install erlang latest
# asdf global erlang latest
#
# log "Updating elixir"
# asdf install elixir latest
# asdf global elixir latest

asdf reshim
