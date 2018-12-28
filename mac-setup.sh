echo "Installing nvm"
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

echo "Installing rbenv"
brew install rbenv ruby-build
# Add rbenv to zsh so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc
source ~/.zshrc

echo "Installing ruby v2.3.1"
rbenv install 2.3.1
rbenv global 2.3.1
rbenv rehash

echo "Installing rails v4.2.8"
gem install rails -v 4.2.8
rbenv rehash

echo "Installing global npm packages"
npm install npm-merge-driver create-react-app -g

echo "Installing databases"
brew install postgresql
brew install mongodb
brew install redis

echo "Configuring mongo DB"
sudo mkdir -p /data/db
sudo chown $USER /data/db

echo "Launching datbase services to start on laptop start"
brew services restart postgresql
brew services start redis
brew services start mongodb

brew cask alfred link
brew cleanup

echo "System setup complete :)"
