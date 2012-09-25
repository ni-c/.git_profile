# .git_profile

Some scripts that provide a nice bash for local *git* repositories, using the bash scripts from the official [Git repository](https://github.com/git/git/tree/master/contrib/completion).

![Screenshot](https://raw.github.com/ni-c/.git_profile/master/screenshot.png)

## Features

- Current branch in bash prompt (see [git-prompt.sh](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh))
- Branch autocompletion (local and remote)
- Very useful *git* shortcuts (see [git-conpletion.bash](https://github.com/git/git/blob/master/contrib/completion/git-completion.bash))
- Global .gitignore file for the (Eclipse IDE)[http://www.eclipse.org/] (yet)
- Colored prompt and *git* output
- Forced *git* user configuration (in case you forgot)

## Installation

**WARNING: Will overwrite your .bashrc, .gitconfig and .gitignore!** (The original files will be renamed to *.original)

    cd ~ && wget https://raw.github.com/ni-c/.git_profile/master/git-prompt-install.sh && chmod +x git-prompt-install.sh && ./git-prompt-install.sh