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
# echo "export NVM_DIR="$HOME/.nvm"" >> ~/.zshrc
# echo "[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"" >> ~/.zshrc # This loads nvm
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
