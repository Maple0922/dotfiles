# http://zsh.sourceforge.net/Doc/Release/Options.html#Description-of-Options
setopt hist_ignore_dups
setopt share_history
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=100000

setopt nonomatch
setopt correct

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#History-Control
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#vcs_005finfo-Configuration
zstyle ':vcs_info:git:*' formats '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '[%b|%a]'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "🌙 "
zstyle ':vcs_info:git:*' unstagedstr "🔥 "


# PROMPT
PROMPT='
%F{7}%!%f %(?,👍,👎) %F{4}%B%~%b%f %F{1}'\$vcs_info_msg_0_' %f
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
alias uni="cd ~/University/2021/2_2"
alias wiz="cd ~/web/wizleap/; ls;"

# FUNCTION
ntf(){
  curl -XPOST -d '{"messages": [{"type": "text","text": "Notification by NotifyBot."}]}' -H 'Content-Type:application/json' -H 'Authorization: Bearer Se+Q9qM/hcQd1tHs2mmvuyOl+FoB22BIaINbMtBaKcOsTc5sj772gyjUVcfVuuuCHP6PQHO5eVupge38F8ZRsO5zlXtVrttG94FJXtZT+PmMrYjcvTmgh3KKwsbTPz79qnOqGrNZPk+I3yJRS3xqFAdB04t89/1O/w1cDnyilFU=' "https://api.line.me/v2/bot/message/broadcast"
}

sshq(){
  cd ~/.ssh
  ssh ${1}
}

firedepfunc(){
  echo "  > firebase deploy --only functions:${1}"
  firebase deploy --only functions:${1}
}

firedephos(){
  echo "  > firebase deploy --only hosting"
  firebase deploy --only hosting
}

phps(){
  php -S localhost:${1:-1234}
}

laravel-cache(){
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
composer dump-autoload
php artisan clear-compiled
php artisan optimize
php artisan config:cache
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
eval "$(anyenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/futonakajima/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

export PATH=~/bin:~/.composer/vendor/bin:/Users/futonakajima/.anyenv/envs/nodenv/shims:/Users/futonakajima/.anyenv/envs/nodenv/bin:/Users/futonakajima/opt/anaconda3/bin:/Users/futonakajima/opt/anaconda3/condabin:/Users/futonakajima/.anyenv/envs/nodenv/shims:/Users/futonakajima/.anyenv/envs/nodenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/opt/X11/bin
source ~/.phpbrew/bashrc
export PATH=/usr/local/opt/php@7.2/bin:$PATH
