#!/usr/bin/env bash

set -v

log() {
  printf "\033[0;32m%s\033[0m\n" "$1"
}

log "Updating ASDF plugins"
asdf plugin update --all

asdf plugin add awscli || true 
asdf plugin add clojure || true 
asdf plugin add dotnet || true
asdf plugin add elixir || true
asdf plugin add erlang || true
asdf plugin add golang || true
asdf plugin add java || true
asdf plugin add kubectl || true
asdf plugin add nodejs || true
asdf plugin add perl || true
asdf plugin add powershell-core || true
asdf plugin add python || true
asdf plugin add ruby || true
asdf plugin add rust || true
asdf plugin add scala || true
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

log "Updating perl"
asdf install perl latest
asdf global perl latest

log "Updating powerhsell"
asdf install powershell-core latest
asdf global powershell-core latest

PYPY=$(asdf list all python pypy | tail -n 1)
ANACONDA=$(asdf list all python anaconda | tail -n 1)
log "Updating python"
asdf install python latest
asdf install python "$PYPY"
asdf install python "$ANACONDA"
asdf global python latest "$PYPY" "$ANACONDA"

JRUBY=$(asdf list all ruby jruby | tail -n 1)
TRUFFLERUBY=$(asdf list all ruby truffleruby- | tail -n 1)
log "Updating ruby"
asdf install ruby latest
asdf install ruby "$JRUBY"
asdf install ruby "$TRUFFLERUBY"
asdf global ruby latest "$JRUBY" "$TRUFFLERUBY"

log "Updating rust"
asdf install rust latest
asdf global rust latest

log "Updating scala"
asdf install scala latest
asdf global scala latest

log "Updating yarn"
asdf install yarn latest
asdf global yarn latest

ERLANG=$(asdf list all erlang | tail -n 1)
OTP=$(echo $ERLANG | cut -f 1 -d ".")
log "Updating erlang"
asdf install erlang "$ERLANG"
asdf global erlang "$ERLANG"


ELIXIR=$(asdf list all elixir | grep -E "\d+.\d+\.\d+-otp-$OTP" | tail -n 1)
log "Updating elixir"
asdf install elixir "$ELIXIR"
asdf global elixir "$ELIXIR"

asdf reshim
