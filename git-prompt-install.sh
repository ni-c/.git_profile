#!/bin/bash
#
# WARNING: This script replaces your .bashrc and .gitconfig files!
#

# Create .bash_profile if necessary
if [ ! -f ~/.bash_profile ]; then
    wget -O ~/.bash_profile https://raw.github.com/ni-c/.git_profile/master/.bash_profile
fi

# Replace .gitconfig
mv ~/.gitconfig ~/.gitconfig.old
wget -O ~/.gitconfig https://raw.github.com/ni-c/.git_profile/master/.gitconfig

# Replace .bashrc
mv ~/.bashrc ~/.bashrc.old
wget -O ~/.bashrc https://raw.github.com/ni-c/.git_profile/master/.bashrc

# Replace .gitignore
mv ~/.gitignore ~/.gitignore.old
wget -O ~/.gitignore https://raw.github.com/ni-c/.git_profile/master/.gitignore
git config --global core.excludesfile ~/.gitignore

# Set Git username
echo -e "\033[1mPlease enter your \033[4mGitHub\033[0m\033[1m username: \033[0m"
read git_user_name
git config --global user.name $git_user_name

# Set Git email
echo -e "\033[1mPlease enter your \033[4mGitHub\033[0m\033[1m email address: \033[0m"
read git_user_email
git config --global user.email $git_user_email

# Delete install script
rm git-prompt-install.sh
echo -e "\033[0;32mdone.\033[0m"
echo -e "\033[1mScripts will be loaded the next time you login.\033[0m"
