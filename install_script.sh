#!/bin/bash

# Install Zsh
if ! command -v zsh >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y zsh
fi

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

exit

# Change the default shell to zsh
sudo chsh -s $(which zsh) $(whoami)

# Set a custom theme (example with 'duellj')
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="duellj"/' ~/.zshrc

# Clone zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Add zsh-autosuggestions to the list of plugins
sed -i 's/plugins=(/&zsh-autosuggestions /' ~/.zshrc

# Source the .zshrc to apply changes
source ~/.zshrc
