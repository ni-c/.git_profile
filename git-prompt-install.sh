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
echo "Please enter your Git username: "
read git_user_name
git config --global user.name $git_user_name

# Set Git email
echo "Please enter your Git email: "
read git_user_email
git config --global user.email $git_user_email

echo "done."
