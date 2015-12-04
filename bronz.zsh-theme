BLUE="%{$FG[195]%}"
YELLOW="%{$fg_bold[yellow]%}"
CYAN="%{$fg_bold[cyan]%}"
RED="%{$fg_bold[red]%}"
WHITE="%{$fg_bold[white]%}"
GREEN="%{$FG[148]%}"
RESET="%{$reset_color%}"

local ret_status="%(?:$GREEN➜ :$RED➜ %s)"

function get_pwd(){
    git_root=$PWD
    while [[ $git_root != / && ! -e $git_root/.git ]]; do
        git_root=$git_root:h
    done
    if [[ $git_root = / ]]; then
        unset git_root
        prompt_short_dir=%~
    else
        parent=${git_root%\/*}
        prompt_short_dir=${PWD#$parent/}
    fi
    echo $prompt_short_dir
}

PROMPT='$ret_status $WHITE%c $(git_prompt_info)$RESET '
ZSH_THEME_GIT_PROMPT_PREFIX="$YELLOW $BLUE"
ZSH_THEME_GIT_PROMPT_SUFFIX="$RESET"
ZSH_THEME_GIT_PROMPT_DIRTY=" $RED✘$RESET"
ZSH_THEME_GIT_PROMPT_CLEAN=" $GREEN✔$RESET"

