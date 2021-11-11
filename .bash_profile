export PS1='👉 \t\[\e[1;94m\] \W\[\e[m\] (__git_ps1)$ '

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
PATH=$PATH:~/bin
PATH=$PATH:~/include
export PATH
PATH=$PATH:~/bin
PATH=$PATH:~/include
export PATH
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
##
# Your previous /Users/futonakajima/.bash_profile file was backed up as /Users/futonakajima/.bash_profile.macports-saved_2019-11-11_at_18:06:05
##

# MacPorts Installer addition on 2019-11-11_at_18:06:05: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH="$PATH:/opt/yarn-[version]/bin"
export PATH=$PATH:$HOME/pear/bin/
export PATH="$(brew --prefix php@7.2)/bin:$PATH"
export PATH=~/.composer/vendor/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export GOPATH=$HOME/go/
export PATH=$GOPATH/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/futonakajima/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/futonakajima/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/futonakajima/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/futonakajima/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=~/.composer/vendor/bin:/Users/futonakajima/opt/anaconda3/bin:/Users/futonakajima/opt/anaconda3/condabin:/Users/futonakajima/.anyenv/envs/nodenv/shims:/Users/futonakajima/.anyenv/envs/nodenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/opt/X11/bin
