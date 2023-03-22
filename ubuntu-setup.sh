gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-only-mounted true

sudo apt update -y && sudo apt upgrade -y

sudo apt install git curl wget neovim neofetch fish zsh htop ncdu gpg -y

# installing vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code

# downloading google chrome
cd Downloads
rm *.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O googlechrome.deb

# downloading discord
wget https://dl.discordapp.net/apps/linux/0.0.25/discord-0.0.25.deb -O discord.deb

# downloading viber
wget https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb -O viber.deb

# downloading ganache truffle
wget https://github.com/trufflesuite/ganache-ui/releases/download/v2.7.0/ganache-2.7.0-linux-x86_64.AppImage

# installing google chrome, discord, viber
sudo apt install ./googlechrome.deb ./discord.deb ./viber.deb -y
rm -rf *.deb

# installing miniconda
rm -rf ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_23.1.0-1-Linux-x86_64.sh -O miniconda.sh
chmod +x miniconda.sh
./miniconda.sh
rm -rf *.sh
cd

# installing nvm and yarn
rm -rf .nvm .npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source .bashrc
nvm install --lts
nvm use --lts
npm install -g yarn

# installing pyenv and adding it to bashrc
sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y
rm -rf .pyenv/
curl https://pyenv.run | bash
echo 'export PATH="$HOME/.pyenv/bin:$PATH"'>>.bashrc
echo 'eval "$(pyenv init --path)"'>>.bashrc
echo 'eval "$(pyenv virtualenv-init -)"'>>.bashrc
source .bashrc
pyenv install 3.11.2
pyenv global 3.11.2

#changing shell
chsh -s /usr/bin/fish

# installing omf
rm -rf .local/share/omf/
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf isntall nvm z

# currently need to type this manually as shell changes !FIXME!
# fish shell config
fish_add_path $PYENV_ROOT/bin
set -Ux PYENV_ROOT $HOME/.pyenv
