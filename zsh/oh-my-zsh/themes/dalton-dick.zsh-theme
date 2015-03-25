ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

p_beginning="%{$fg_bold[red]%}┌──"
p_error_code="%{$fg_bold[black]%}(%?)"
p_history_count="[%h]"

p_battery_pct () {
  echo "%{$fg[yellow]%}$(battery_pct)%%"
}

p_date="%{$fg_bold[magenta]%}%W"
p_time="%{$fg_bold[green]%}%t"
p_line="%{$fg_bold[red]%}|"
p_location="%{$fg[cyan]%}%n@%m:"
p_directory="%{$fg[cyan]%}%~"

p_git () {
  echo "%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}"
}

p_ending="%{$fg_bold[red]%}└──> %{$reset_color%}"

PROMPT='
$p_beginning $p_error_code $p_history_count $(p_battery_pct) $p_date $p_time 
$p_line $p_location$p_directory $(p_git)
$p_ending'
