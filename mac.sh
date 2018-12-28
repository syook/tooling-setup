#!/bin/bash
read -p "Enter your name? " name
read -p "Enter your email? " email

echo "Hi, $name"
echo "You email is $email"

echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Fetch latest version of homebrew and formula.
echo "Updating homebrew..."
brew update

echo "Cleaning up brew"
brew cleanup

# Tap the Caskroom/Cask repository from Github using HTTPS.
echo "Installing homebrew cask"
brew install caskroom/cask/brew-cask

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting up Oh My Zsh theme..."
cd  /Users/bradparbs/.oh-my-zsh/themes
curl https://gist.githubusercontent.com/bradp/a52fffd9cad1cd51edb7/raw/cb46de8e4c77beb7fad38c81dbddf531d9875c78/brad-muse.zsh-theme > brad-muse.zsh-theme

echo "Setting up Zsh plugins..."
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

echo "Installing Git..."
brew install git

echo "Git config"
git config --global color.ui true
git config --global user.name $name
git config --global user.email $email

echo "Creating an SSH key for you..."
ssh-keygen -t rsa -C $email

echo "Installing brew git utilities..."
brew install git-extras
brew install legit
brew install git-flow
bew install findutils

echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install trash
brew install svn
brew install mackup


echo "Install nvm"
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
# brew install nvm
echo "source ~/.nvm/nvm.sh" >> ~/.zshrc
echo "export NVM_DIR="$HOME/.nvm"" >> ~/.zshrc
echo "[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"" >> ~/.zshrc # This loads nvm
# activate configuration
source ~/.zshrc

echo "Installing node"
nvm install v8.9.4
nvm use v8.9.4


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

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

# Launch on computer start
brew services start redis
brew services start mongodb

brew cask alfred link
brew cask cleanup
brew cleanup

# Configure MongoDB
sudo mkdir -p /data/db
sudo chown $USER /data/db
