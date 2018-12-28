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

echo "Installing Git..."
brew install git

echo "Git config"
git config --global color.ui true
git config --global user.name $name
git config --global user.email $email

echo "Creating an SSH key for you..."
echo "$(tput setaf 3) Just press enter for all the inputs"
ssh-keygen -t rsa -C $email
echo "$(tput setaf 3) Enter file to save as below $(tput setaf 2) $HOME/.ssh/id_rsa_sparkyo"
ssh-keygen -t rsa -C $email

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

echo "Please restart terminal to continue with zsh"
