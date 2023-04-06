sudo apt update && sudo apt install nala
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-only-mounted true

sudo nala update -y && sudo apt upgrade -y

sudo nala install git curl wget neovim neofetch fish zsh htop ncdu gpg chrome-gnome-shell gnome-shell-extensions gnome-tweaks lm-sensors -y

# installing vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo nala install apt-transport-https -y
sudo nala update -y
sudo nala install code -y

# downloading google chrome
cd Downloads
rm *.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O googlechrome.deb

# downloading discord
wget https://dl.discordapp.net/apps/linux/0.0.25/discord-0.0.25.deb -O discord.deb

# downloading viber
wget https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb -O viber.deb

# downloading ganache truffle
#wget https://github.com/trufflesuite/ganache-ui/releases/download/v2.7.0/ganache-2.7.0-linux-x86_64.AppImage

# installing google chrome, discord, viber
sudo nala install ./googlechrome.deb ./discord.deb ./viber.deb -y
rm -rf *.deb

# installing miniconda
rm -rf ~/miniconda3
cd ~/Downloads
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_23.1.0-1-Linux-x86_64.sh -O miniconda.sh
chmod +x miniconda.sh
./miniconda.sh
rm -rf *.sh
cd

chsh -s /usr/bin/fish

# installing rbenv
sudo nala install libz-dev libyaml-dev libssl-dev liblzma-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'eval "$(~/.rbenv/bin/rbenv init - bash)"' >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
git -C "$(rbenv root)"/plugins/ruby-build pull

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
curl https://pyenv.run | bash
