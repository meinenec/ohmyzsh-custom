#!/bin/zsh

func backup_zshrc() {
    mv "$HOME/.zshrc" "$HOME/old.zshrc"
}

func revert_backup_zshrc() {
    mv "$HOME/old.zshrc" "$HOME/.zshrc"
}

# make a backup of the existing .zshrc (if it exists)
if [ -e $HOME/.zshrc ]
then
    backup_zshrc
fi

if [ -e $HOME/.ohmyzsh-custom ]
then
    echo "$HOME/.ohmyzsh-custom already exists. Remove to continue."
    revert_backup_zshrc
    exit 1
fi

# clone the repo
git clone git@github.com:meinenec/ohmyzsh-custom.git $HOME/.ohmyzsh-custom
if [ $? -nq 0 ]; then
  echo "failed to clone ohmyzsh-custom"
  revert_backup_zshrc
  exit 1
fi

# populate a new .zshrc
cat > "$HOME/.zshrc" <<- 'EOM'
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.ohmyzsh-custom

source $ZSH_CUSTOM/custom.zshrc
source $ZSH/oh-my-zsh.sh
EOM

# create a local.zshrc file for local modifications
cat > "$HOME/.ohmyzsh-custom/local.zshrc" <<- 'EOM'
### Add any configuration needed by the local host here.
### This file has been added to the .gitignore so changes won't be tracked.
### It is the last file loaded.
EOM