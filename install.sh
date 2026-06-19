#! /bin/bash

##################################################
# Script Preparation #############################
##################################################
export NONINTERACTIVE=1 # Removes confirmation prompts
cd $HOME # Changes to home directory

sudo apt update -y
sudo apt upgrade -y

##################################################
# Ubuntu Repositories ############################
##################################################
echo "Setting up ubuntu apt repositories..."

sudo add-apt-repository -y ppa:git-core/ppa # Git

sudo apt update -y
sudo apt upgrade -y

##################################################
# Dependencies ###################################
##################################################
echo "Installing Dependencies..."

#------------------------------------------------#
#- Homebrew -------------------------------------#
#------------------------------------------------#
sudo apt-get install -y build-essential procps curl file

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc

echo "Homebrew installed!"

#------------------------------------------------#
#- Python ---------------------------------------#
#------------------------------------------------#
sudo apt install -y python3 python-is-python3 python3-venv python3-pip

echo "Python installed!"

#------------------------------------------------#
#- Uv -------------------------------------------#
#------------------------------------------------#
brew install uv

echo "Uv installed!"

#------------------------------------------------#
#- Go -------------------------------------------#
#------------------------------------------------#
sudo apt install -y golang-go

echo "Go installed!"

#------------------------------------------------#
#- Git ------------------------------------------#
#------------------------------------------------#
sudo apt-get install -y git

echo "Git installed!"

#------------------------------------------------#
#- Node Version Manager -------------------------#
#------------------------------------------------#
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash

cat <<'EOF' >> ~/.bashrc
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
EOF

source ~/.bashrc

echo "Node version manager installed!"

#------------------------------------------------#
#- Node/Npm -------------------------------------#
#------------------------------------------------#
nvm install node
nvm alias default node

echo "Latest node/npm verison installed!"

#------------------------------------------------#
#- Clipboard ------------------------------------#
#------------------------------------------------#
sudo apt install -y wl-clipboard

echo "Clipboard utility installed!"

#------------------------------------------------#
#- Slurp/Grim (Screenshots) ---------------------#
#------------------------------------------------#
sudo apt install -y slurp grim

echo "Screenshot utilities installed!"

#------------------------------------------------#
#- Audio Controller (Waybar) --------------------#
#------------------------------------------------#
sudo apt install -y pavucontrol

echo "Audio controller installed!"

#------------------------------------------------#
#- GNU Stow -------------------------------------#
#------------------------------------------------#
brew install stow

echo "GNU Stow installed!"

#------------------------------------------------#
#- Nerd Font (Jetbrains Mono) -------------------#
#------------------------------------------------#
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMonoNerd
mv JetBrainsMonoNerd ~/.fonts
rm JetBrainsMono.zip

fc-cache -fv

echo "Jetbrains Mono Nerd Font installed!"

#------------------------------------------------#
#- Tree Sitter CLI ------------------------------#
#------------------------------------------------#
npm install -g tree-sitter-cli

echo "Tree sitter cli installed!"

#------------------------------------------------#
#- Dotfiles -------------------------------------#
#------------------------------------------------#
git clone https://github.com/Mosi-HB-2006/dotfiles.git
cd dotfiles
stow */
cd ..

echo "Dotfiles installed!"

##################################################
# Applications ###################################
##################################################
echo "Installing applications..."

#------------------------------------------------#
#- Sway WM --------------------------------------#
#------------------------------------------------#
sudo apt install -y sway

echo "Sway window manager installed!"

#------------------------------------------------#
#- Kitty ----------------------------------------#
#------------------------------------------------#
sudo apt install -y kitty

echo "Kitty terminal emulator installed!"

#------------------------------------------------#
#- Neovim (V12) ---------------------------------#
#------------------------------------------------#
brew install -y neovim

echo "Neovim installed!"

#------------------------------------------------#
#- Waybar ---------------------------------------#
#------------------------------------------------#
sudo apt install -y waybar

echo "Waybar installed!"

#------------------------------------------------#
#- Rofi -----------------------------------------#
#------------------------------------------------#
brew install -y rofi

echo "Rofi installed!"

#------------------------------------------------#
#- zsh ------------------------------------------#
#------------------------------------------------#
sudo apt install zsh
chsh -s $(which zsh) # Sets zsh as the default shell

echo "Zsh installed!"

#------------------------------------------------#
#- Oh my zsh ------------------------------------#
#------------------------------------------------#
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Oh my zsh installed!"

#------------------------------------------------#
#- Zsh auto suggestions -------------------------#
#------------------------------------------------#
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Zsh auto suggestions installed!"

#------------------------------------------------#
#- Atuin ----------------------------------------#
#------------------------------------------------#
brew install atuin

echo "Atuin installed!"
