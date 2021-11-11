export PATH=/opt/homebrew/bin:/bin:~/.composer/vendor/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/opt/X11/bin

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

laracache(){
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
composer dump-autoload
php artisan clear-compiled
php artisan optimize
php artisan config:cache
}

dep(){
  now=`date "+%Y/%m/%d %H:%M"`
  git add .
  git commit -m "${1:-${now}}"
  git push origin ${2:-master}
}

setrc(){
  vim ~/.${1:-zsh}rc
  source ~/.${1:-zsh}rc
  echo "😊 ${1:-zsh}rc was updated!!"
}

