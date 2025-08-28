#!/bin/sh

echo "Initialising Custom Arch Install"
sudo pacman -Syu
sudo pacman -S yay
echo ""

echo "Installing basics"
sudo pacman -S git tmux doppler pass stow
sudo pacman -S pipewire wireplumber pipewire-audio pipewire-pulse
echo ""

echo "Installing Nvim"
sudo pacman -S nvim
git clone https://github.com/MDietermann/NvimConfig.git ~/git-clones/nvim
sudo ln -sf ~/git-clones/nvim ~/.config/nvim
echo ""

echo "Installing yazi file manager"
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick
echo ""

echo "Installing Hyprland with Custom Dotfiles"
mkdir git-clones
cd git-clones
git clone --depth=1 https://github.com/JaKooLit/Arch-Hyprland.git ~/git-clones/Arch-Hyprland
cd ~/git-clones/Arch-Hyprland
chmod +x install.sh
./install.sh
echo ""
