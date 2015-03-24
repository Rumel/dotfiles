ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

BEGINNING="%{$fg_bold[red]%}┌──"
ERROR_CODE="%{$fg_bold[black]%}(%?)"
HISTORY_COUNT="[%h]"
BATTERY_PCT="%{$fg[yellow]%}$(battery_pct)%%"
DATE="%{$fg_bold[magenta]%}%W"
TIME="%{$fg_bold[green]%}%t"
LINE="%{$fg_bold[red]%}|"
LOCATION="%{$fg[cyan]%}%n@%m:"
DIRECTORY="%{$fg[cyan]%}%~"
GIT="%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}"
ENDING="%{$fg_bold[red]%}└── %{$reset_color%}"
PROMPT="
$BEGINNING $ERROR_CODE $HISTORY_COUNT $BATTERY_PCT $DATE $TIME 
$LINE $LOCATION$DIRECTORY $GIT
$ENDING"
 
