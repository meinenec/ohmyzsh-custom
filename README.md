# ohmyzsh-custom

## install

### easy

`zsh -c "$(curl -fsSL https://raw.githubusercontent.com/meinenec/ohmyzsh-custom/master/tools/install.sh)"`

### manual

Clone this repo into `$HOME/.ohmyzsh-custom`

- You can use any directory as long as you also update your .zshrc (below)

replace the contents of `$HOME/.zshrc` with:

```zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.ohmyzsh-custom

source $ZSH_CUSTOM/custom.zshrc
source $ZSH/oh-my-zsh.sh
```
