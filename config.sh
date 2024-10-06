# ??? não sei qual ppa é esse ai
sudo add-apt-repository ppa:aslatter/ppa

# neovim ppa
sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt update

sudo apt-get install alacritty gh snapd ripgrep fd-find -y

# Customizar o Vivaldi
# https://github.com/tovifun/VivalArc

# Broser extensions
# dark reader
# bitwardin

cd ./Downloads/

{
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
} || {
  echo ''
}

font_url='https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip'
font_name=${font_url##*/}
wget -nc ${font_url} && unzip -o ${font_name} -d ~/.fonts && fc-cache -fv && echo 'nerd font'

if command -v lazygit >/dev/null; then
  echo 'lazygit already installed'
else
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
  lazygit --version
  rm lazygit.tar.gz
fi

curl -sS https://starship.rs/install.sh | sh

git config --global user.email "hoffman.devs@gmail.com"
git config --global user.name "Hoffmano"
gh auth login

sudo apt upgrade -y
sudo apt autoremove -y && sudo apt clean -y
