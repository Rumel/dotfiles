alias editconfig="vim ~/.zshrc"
alias editvim="vim ~/.vimrc"
alias gitcleanup="git branch --merged master | grep -v \"* master\" | xargs git branch -D"
alias pcat="pygmentize -f terminal256 -O style=native -g"
alias prodlogs="(cd ~/Github/fishscale; heroku logs --app powderhook --tail)"
alias reload="source ~/.zshrc"
alias staglogs="(cd ~/Github/fishscale; heroku logs --remote staging --tail)"
alias vag="vagrant"

if [[ $LINUX = true ]]; then
  source $DOTFILES/zsh/ubuntu-aliases.zsh
else
  source $DOTFILES/zsh/osx-aliases.zsh
fi
