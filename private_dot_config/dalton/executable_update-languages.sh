#!/usr/bin/env bash

set -v

pushd > /dev/null
cd ~ > /dev/null

UPDATE=false
if [ "$1" == "-u" ]; then
  UPDATE=true
fi

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

if [[ $UPDATE = "true" ]]; then
  log "Updating AWS CLI"
  asdf install awscli latest
  asdf global awscli latest
else
  log "Installing AWS CLI"
  asdf install awscli
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating babashka"
  asdf install babashka latest
  asdf global babashka latest
else
  log "Installing babashka"
  asdf install babashka
fi

if [[ $UPDATE = "true" ]]; then
  JAVA_VERSION=$(asdf list all java | grep corretto | tail -n 1)
  log "Updating Java with $JAVA_VERSION"
  asdf install java "$JAVA_VERSION"
  asdf global java "$JAVA_VERSION"
else
  log "Installing Java"
  asdf install java
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating clojure"
  asdf install clojure latest
  asdf global clojure latest
else
  log "Installing Clojure"
  asdf install clojure
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating dotnet"
  asdf install dotnet latest
  asdf global dotnet latest
else
  log "Installing dotnet"
  asdf install dotnet
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating golang"
  asdf install golang latest
  asdf global golang latest
else
  log "Installing golang"
  asdf install golang
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating haskell"
  asdf install haskell latest
  asdf global haskell latest
else
  log "Installing haskell"
  asdf install haskell
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating kubectl"
  asdf install kubectl latest
  asdf global kubectl latest
else
  log "Installing kubectl"
  asdf install kubectl
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating ocaml"
  asdf install ocaml latest
  asdf global ocaml latest
else
  log "Installing ocaml"
  asdf install ocaml
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating opam"
  asdf install opam latest
  asdf global opam latest
else
  log "Installing opam"
  asdf install opam
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating nodejs"
  asdf install nodejs lts
  asdf install nodejs latest
  asdf global nodejs latest lts
else
  log "Installing nodejs"
  asdf install nodejs
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating perl"
  asdf install perl latest
  asdf global perl latest system
else
  log "Installing perl"
  asdf install perl
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating powerhsell"
  asdf install powershell-core latest
  asdf global powershell-core latest
else
  log "Installing powershell"
  asdf install powershell-core
fi

if [[ $UPDATE = "true" ]]; then
  PYPY=$(asdf list all python pypy | tail -n 1)
  # ANACONDA=$(asdf list all python anaconda | tail -n 1)
  log "Updating python"
  asdf install python latest
  asdf install python "$PYPY"
  asdf install python "$ANACONDA"
  # asdf global python latest "$PYPY" "$ANACONDA" system
  asdf global python latest "$PYPY" system
else
  log "Installing python"
  asdf install python 
fi

if [[ $UPDATE = "true" ]]; then
  JRUBY=$(asdf list all ruby jruby | tail -n 1)
  TRUFFLERUBY=$(asdf list all ruby truffleruby- | tail -n 1)
  log "Updating ruby"
  asdf install ruby latest
  asdf install ruby "$JRUBY"
  asdf install ruby "$TRUFFLERUBY"
  asdf global ruby latest "$JRUBY" "$TRUFFLERUBY" system
else
  log "Installing ruby"
  asdf install ruby 
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating rust"
  asdf install rust latest
  asdf global rust latest
else
  log "Installing rust"
  asdf install rust 
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating sbt"
  asdf install sbt latest
  asdf global sbt latest
else
  log "Installing sbt"
  asdf install sbt 
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating scala"
  asdf install scala latest
  asdf global scala latest
else
  log "Installing scala"
  asdf install scala 
fi

if [[ $UPDATE = "true" ]]; then
  log "Updating yarn"
  asdf install yarn latest
  asdf global yarn latest
else
  log "Installing yarn"
  asdf install yarn 
fi

if [[ $UPDATE = "true" ]]; then
  ERLANG=$(asdf list all erlang | tail -n 1)
  OTP=$(echo $ERLANG | cut -f 1 -d ".")
  log "Updating erlang"
  asdf install erlang "$ERLANG"
  asdf global erlang "$ERLANG"
else
  log "Installing erlang"
  asdf install erlang 
fi


if [[ $UPDATE = "true" ]]; then
  ELIXIR=$(asdf list all elixir | grep -E "\d+.\d+\.\d+-otp-$OTP" | tail -n 1)
  log "Updating elixir"
  asdf install elixir "$ELIXIR"
  asdf global elixir "$ELIXIR"
else
  log "Installing elixir"
  asdf install elixir 
fi

asdf reshim

popd > /dev/null
