fancy_echo() {
  LightBlue='\033[0;34m'
  NC='\033[0m' # No Color
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\\n${LightBlue}$fmt${NC}\\n" "$@"
}

echo "Installing brew git utilities..."
brew install git-extras
brew install legit
brew install git-flow
brew install findutils

echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install trash
brew install svn
brew install mackup


echo "Install nvm"
# curl https://raw.github.com/creationix/nvm/master/install.sh | sh
brew install nvm
mkdir ~/.nvm
echo "export NVM_DIR="$HOME/.nvm"" >> ~/.zshrc
# This loads nvm
echo "[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"" >> ~/.zshrc
# This loads nvm bash_completion
echo "[ -s "usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"" >> ~/.zshrc

echo "Installing node"
nvm install v8.9.4
nvm use v8.9.4

# activate configuration
# echo "source ~/.nvm/nvm.sh" >> ~/.zshrc
source ~/.zshrc



# Apps
apps=(
  evernote
  # filezilla
  # firefox
  google-chrome
  iterm2
  # libreoffice
  mongodb
  postgresql
  redis
  slack
  visual-studio-code
  # vlc
)

fancy_echo "Installing packages..."
brew install ${PACKAGES[@]}

fancy_echo "Cleaning up..."
brew cleanup -s


fancy_echo "Installing cask apps..."
brew cask install ${CASKS[@]}

# # Install apps to /Applications
# # Default is: /Users/$user/Applications
# echo "installing apps with Cask..."
# brew cask install --appdir="/Applications" ${apps[@]}

# Launch on computer start
brew services start redis
brew services start mongodb

brew cask alfred link
brew cask cleanup
brew cleanup

# Configure MongoDB
sudo mkdir -p /data/db
sudo chown $USER /data/db
