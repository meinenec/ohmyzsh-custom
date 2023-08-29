#!/bin/zsh

func ohmyzsh_custom_check_for_update() {
    upstream_location=/tmp/ohmyzsh-custom.zshrc
    curl -fsSL https://raw.githubusercontent.com/meinenec/ohmyzsh-custom/master/custom.zshrc -o "$upstream_location"
    checksum1=$(md5sum $ZSH_CUSTOM/custom.zshrc | awk '{print $1}')
    checksum2=$(md5sum $upstream_location | awk '{print $1}')

    if [ "$checksum1" = "$checksum2" ]; then
        return 0
    else 
        echo "The local branch does not match the upstream."
        return 1
    fi
}
