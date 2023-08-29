COLOR_DEFAULT="%{$fg[white]%}"
COLOR_SUCCESS="%{$fg[green]%}"
COLOR_FAILURE="%{$fg[red]%}"
COLOR_GIT_BRANCH="%{$fg[cyan]%}"
COLOR_GIT_DIRTY="%{$fg[magenta]%}"
COLOR_GIT_REMOTE_BEHIND="%{$fg[red]%}"
COLOR_GIT_REMOTE_DIVERGED="%{$fg[red]%}"
COLOR_GIT_REMOTE_AHEAD="%{$fg[yellow]%}"

PROMPT_CHAR_SUCCESS=" → "

# list 2 directories back - switch to %2d to replace $HOME with '~'
DIRECTORY_LEVELS='2'
DIRECTORY="%${DIRECTORY_LEVELS}d"

# git branch
ZSH_THEME_GIT_PROMPT_PREFIX="$COLOR_GIT_BRANCH("
ZSH_THEME_GIT_PROMPT_SUFFIX="$COLOR_GIT_BRANCH)$COLOR_DEFAULT"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
# git remote
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE=""
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="$COLOR_GIT_REMOTE_AHEAD↑$COLOR_DEFAULT"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="$COLOR_GIT_REMOTE_BEHIND↓$COLOR_DEFAULT"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="$COLOR_GIT_REMOTE_DIVERGED↕$COLOR_DEFAULT"

func DELTA_GIT_PROMPT() {
    print "$(git_prompt_info)$(git_remote_status)"
}

PROMPT='%(?,$COLOR_SUCCESS,$COLOR_FAILURE)$PROMPT_CHAR_SUCCESS$COLOR_DEFAULT'
RPROMPT='$DIRECTORY$(DELTA_GIT_PROMPT)'