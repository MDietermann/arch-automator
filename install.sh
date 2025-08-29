#!/bin/sh

echo "Initialising Custom Arch Install"
sudo pacman -Syu
echo "-------------------------"

echo "Creating required folders"
mkdir ~/git-clones/
echo "-------------------------"

echo "Installing basics"
sudo pacman -S git tmux doppler pass stow
sudo pacman -S pipewire wireplumber pipewire-audio pipewire-pulse
echo "-------------------------"

echo "Loading needed Git Repositories"
cd ~/git-clones/
git clone https://aur.archlinux.org/yay-bin.git ~/git-clones/yay-bin
git clone https://github.com/MDietermann/NvimConfig.git ~/git-clones/nvim
git clone --depth=1 https://github.com/JaKooLit/Arch-Hyprland.git ~/git-clones/Arch-Hyprland
git clone https://gitlab.com/perthshiretim/grubby-terminal.git
cd ~
echo "-------------------------"

echo "Installing yay"
cd ~/git-clones/yay-bin
sudo pacman -S base-devel
makepkg -si
cd ~
echo "-------------------------"

echo "Installing Keeper Password manager"
yay pacman -S keeper-password-manager
echo "-------------------------"

echo "Installing Nvim"
sudo pacman -S nvim
sudo ln -sf ~/git-clones/nvim ~/.config/nvim
echo "-------------------------"

echo "Installing yazi file manager"
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick
echo "-------------------------"

echo "Installing Hyprland with Custom Dotfiles"
cd ~/git-clones/Arch-Hyprland
chmod +x install.sh
./install.sh
echo "-------------------------"

echo "Installing Grub Theme"
cd ~/git-clones/grubby-terminal
chmod -x install.sh
sudo sh install.sh
sudo grub-mkconfig
echo "-------------------------"

echo "All done!"
