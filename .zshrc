

# http://zsh.sourceforge.net/Doc/Release/Options.html#Description-of-Options
setopt hist_ignore_dups
setopt share_history
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=100000

setopt nonomatch
setopt correct

autoload -Uz compinit && compinit

# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#History-Control
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#vcs_005finfo-Configuration
zstyle ':vcs_info:git:*' formats '(%b %u%c)'
zstyle ':vcs_info:git:*' actionformats '[%b|%a]'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "*"


# PROMPT
PROMPT='
%F{7}%!%f %(?,😊,🥺) %F{4}%~%f %F{1}'\$vcs_info_msg_0_' %f
\$ '
RPROMPT="%K{0}%F{2}%U20%D %*%u%f%k"
# black	0
# red	1
# green	2
# yellow	3
# blue	4
# magenta	5
# cyan	6
# white	7

# ALIAS
alias ls='ls -AFG'
alias ll='ls -hlt'
alias history='history -Di'
alias pack="cat package.json"


# FUNCTION
sshq(){
  cd ~/.ssh
  ssh ${1}
}

phps(){
  php -S localhost:${1:-1234}
}

tenki(){
  curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Tokyo}"
}

dep(){
  now=`date "+%Y/%m/%d %H:%M"`
  git add .
  git commit -m "${1:-${now}}"
  git push origin ${2:-master}
}

newsite(){
  mkdir ${1:-newsite}
  git clone https://github.com/Maple0922/test-site.git ${1:-newsite}
  cd ${1:-newsite}
  rm -rf .git
  git init
  echo package.json >> .gitignore
  git add .
  git commit -m 'initial commit'
  npm i
  npm audit fix --force
  echo ${1:-newsite} | pbcopy
  gh repo create ${1:-newsite} -y --public
  git push -u origin master
  open https://github.com/Maple0922/${1:-newsite}
}

noti(){
  terminal-notifier -message ${1:-"Command has been completed!!"}
}

setrc(){
  vim ~/.${1:-bash}rc
  source ~/.${1:-bash}rc
  echo "😊 ${1:-bash}rc was updated!!"
}
