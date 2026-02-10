#!/bin/sh

echo "Initialising Custom Arch Install"
sudo pacman -Syu
echo "-------------------------"

echo "\t 1. Creating required folders"
mkdir ~/git-clones/
echo "-------------------------"

echo "\t 2. Installing basics"
sudo pacman -S --noconfirm base-devel git doppler pass pipewire wireplumber pipewire-audio pipewire-pulse sudo curl
echo "-------------------------"

echo "\t 3. Loading needed Git Repositories"
cd ~/git-clones/
echo "\t\t 1. Yay"
git clone https://aur.archlinux.org/yay-bin.git ~/git-clones/yay-bin
echo "\t\t 2. Grubby Terminal"
git clone https://gitlab.com/perthshiretim/grubby-terminal.git
cd ~
echo "-------------------------"

echo "\t 4.Installing yay"
cd ~/git-clones/yay-bin
makepkg -si
cd ~
echo "-------------------------"

echo "\t 5. Installing Keeper Password manager"
yay pacman -S keeper-password-manager
echo "-------------------------"

echo "\t 6. Installing Lazyvim"
echo "\t\t 1. Installing NeoVim"
yay pacman -S neovim-git
echo "\t\t 2. Installing a Nerd Font"
yay pacman -S nerd-fonts --no-confirm
echo "\t\t 3. Installing LazyGit"
sudo pacman -S lazygit
echo "\t\t 4. Installing treesitter-cli"
sudo pacman -S nvim-treesitter --no-confirm
echo "\t\t 5. Installing fzf, ripgrep, fd"
sudo pacman -S fzf ripgrep fd
echo "\t\t 6. Installing Kitty"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

echo "\t\t Starting LazyVim Installation"
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
echo "-------------------------"

echo "\t 7. Installing yazi file manager"
sudo pacman -S yazi ffmpeg 7zip jq poppler zoxide resvg imagemagick
echo "-------------------------"

echo "\t 8. Installing Grub Theme"
cd ~/git-clones/grubby-terminal
chmod -x install.sh
sudo sh install.sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "-------------------------"

echo "\t 9. Installing Hyprland"
sudo pacman -S dolphin hyprland waybar hyprpaper ttf-font-awesome --no-confirm
yay pacman -S hyprshot swaync hyprlock hypridle hyprlauncher --no-confirm
cp ~/arch-automator/hyprland.conf ~/.config/hypr/hyprland.conf
cp ~/arch-automator/hyprlock.conf ~/.config/hypr/hyprlock.conf
cp ~/arch-automator/hypridle.conf ~/.config/hypr/hypridle.conf
echo "-------------------------"

echo "All done!"
