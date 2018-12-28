echo "Install nvm"
# curl https://raw.github.com/creationix/nvm/master/install.sh | sh
brew install nvm
mkdir ~/.nvm
echo "export NVM_DIR="$HOME/.nvm"" >> ~/.zshrc
# This loads nvm
echo "[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"" >> ~/.zshrc
# This loads nvm bash_completion
echo "[ -s "usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"" >> ~/.zshrc
source ~/.zshrc

echo "Installing node"
nvm install v8.9.4
nvm use v8.9.4

# activate configuration
echo "source ~/.nvm/nvm.sh" >> ~/.zshrc

# PACKAGES
PACKAGES=(
  evernote
  # filezilla
  # firefox
  google-chrome
  iterm2
  # libreoffice
  slack
  visual-studio-code
  # vlc
)

echo "Installing cask apps..."
brew cask install ${PACKAGES[@]}

# Databases
brew install postgresql
brew install mongodb
brew install redis

# Configure MongoDB
sudo mkdir -p /data/db
sudo chown $USER /data/db

# Launch on computer start
brew services restart postgresql
brew services start redis
brew services start mongodb

brew cask alfred link
brew cleanup
