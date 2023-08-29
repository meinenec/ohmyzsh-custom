ZSH_THEME="deltabrainwave"

unsetopt beep
export EDITOR='vim'
zstyle ':omz:update' mode auto # automatically update without asking

## declare additional zshrc files to load from "$ZSH_CUSTOM/zshrc"
declare -a zshrcs=("aliases" "plugins" "update") 
for zshrc in "${zshrcs[@]}"
do
    if [ -f $ZSH_CUSTOM/zshrc/$zshrc.zshrc ]; then
        source $ZSH_CUSTOM/zshrc/$zshrc.zshrc
    else
        print "404: $ZSH_CUSTOM/zshrc/$zshrc.zshrc not found."
    fi
done

source $ZSH_CUSTOM/local.zshrc
