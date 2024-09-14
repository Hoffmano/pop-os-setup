sudo apt update

sudo apt-get install gh snapd ripgrep fd-find gnome-tweaks -y

sudo snap install alacritty --classic
sudo snap install nvim --classic

sudo snap install vivaldi
# Customizar o Vivaldi
# https://github.com/tovifun/VivalArc

# Broser extensions
# dark reader
# bitwardin

wallpaperUrl='https://images.wallpapersden.com/image/download/macos-12-monterey-stock-light_bGxsaGmUmZqaraWkpJRobWllrWdma2U.jpg'

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

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
lazygit --version

# install gnome theme
echo 'Install Gnome Themes'
echo 'Enter: https://www.gnome-look.org/browse'
echo 'Extract files to .icons and .themes'
cd
mkdir -p .themes
mkdir -p .icons
while true; do
  read -p "Do you want to continue?" yn
  case $yn in
  [Yy]*) break ;;
  [Nn]*) exit ;;
  *) echo "Please answer yes or no." ;;
  esac
done

gh auth login
git config --global user.email "hoffman.devs@gmail.com"
git config --global user.name "Hoffmano"

sudo apt upgrade -y
sudo apt autoremove -y && sudo apt clean -y
