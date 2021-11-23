#!/bin/bash

read -p "Enter your name -> " name
if [ -z "$name" ]; then
  echo "$(tput setaf 1)\n Please enter your name"
  exit 1
else
  echo "Hi, $name"
fi

read -p "Enter your email -> " email
if [ -z "$email" ]; then
  echo "$(tput setaf 1)\n Please enter your email"
  exit 1
else
  echo "You email is $email"
fi

echo "Git config"
git config --global color.ui true
git config --global user.name $name
git config --global user.email $email

echo "Creating an SSH key for you..."
echo "$(tput setaf 3) Just press enter for all the inputs"
ssh-keygen -t rsa -C $email
echo "$(tput setaf 3) Enter file to save as below $(tput setaf 2) $HOME/.ssh/id_rsa_sparkyo"
ssh-keygen -t rsa -C $email

sudo apt update

#Install Zsh & Oh My Zsh
sudo apt install -y zsh
zsh --version
chsh -s $(which zsh)
source ~/.zshrc
echo "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Setting up Oh My Zsh theme..."
cd  /Users/bradparbs/.oh-my-zsh/themes
curl https://gist.githubusercontent.com/bradp/a52fffd9cad1cd51edb7/raw/cb46de8e4c77beb7fad38c81dbddf531d9875c78/brad-muse.zsh-theme > brad-muse.zsh-theme

echo "Setting up Zsh plugins..."
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

echo "Please restart terminal to continue with zsh"