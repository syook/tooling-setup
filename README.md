# Tolling Setup

1. Linux

- first run the ./linux-initial-setup.sh file
  - This will configure the git and generate the ssh key which will be used for cloning the repository
  - Next it will install zsh shell and oh-my-zsh

  ```shell
  sh linux-initial-setup.sh
  ```

- whenever it asks for the password, please enter the system password
- Once the initial setup is done, please quit the terminal & start the terminal again

- Now run the linux-full-setup.sh file
  - This will setup the folder structure necessary for the project related services
  - Will install node version manager (NVM)
  - Install docker, docker-compose

  ```shell
  sh linux-full-setup.sh
  ```

2. Mac

- First run initial-setup file to set git user & install zsh

  ```shell
  sh mac-initial-setup.sh
  ```   

  After completion restart terminal to setup zsh as default bash (May require)

- Next run mac setup file to install various packages

   ```shell
   sh mac-full-setup.sh
   ```
