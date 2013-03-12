# .git_profile

Some scripts that provide a nice bash for local *git* repositories, using the bash scripts from the official [Git repository](https://github.com/git/git/tree/master/contrib/completion).

![Screenshot](https://raw.github.com/ni-c/.git_profile/master/screenshot.png)

## Features

- Current branch in bash prompt (see [git-prompt.sh](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh))
- Branch autocomplete (local and remote, see [git-completion.bash](https://github.com/git/git/blob/master/contrib/completion/git-completion.bash))
- Very useful *git* shortcuts (Subversion like: st - status, ci - commit, co - checkout)
- Global .gitignore file for the [Eclipse IDE](http://www.eclipse.org/) (yet)
- Colored prompt and *git* output
- Forced *git* user configuration (in case you forgot)

## Installation

**WARNING: Will overwrite your .bashrc, .gitconfig and .gitignore!** (The original files will be renamed to *.original)

````bash
cd ~ && sh <(curl https://raw.github.com/ni-c/.git_profile/master/git-prompt-install.sh -L)
````
    
If you do not have a bash-compatible shell:
    
````bash
cd ~
curl http://tinyurl.com/gitprofile -L
chmod +x git-prompt-install.sh
./git-prompt-install.sh
````
    
## MIT License

Copyright (c) 2012 Willi Thiel

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
