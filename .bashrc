source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
stty stop undef

GIT_PS1_SHOWDIRTYSTATE=true

export PS1='\n\[\e[1;97m\]\# ✍️  \[\e[0;3;32m\]\t \[\e[0;1;34m\]\w\[\e[m\]\[\033[31m\] $(__git_ps1 "(%s) ")\[\033[00m\] \n $ '

export PATH=$PATH:/Users/futonakajima/.nodebrew/current/bin

source ~/git-completion.bash

alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"
alias pack="cat package.json"
eval "$(gh completion -s bash)"

tenki(){
  curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Tokyo}"
}

dep(){
  now=`date "+%Y/%m/%d %H:%M"`
  git add .
  git commit -m "${1:-${now}}"
  git push origin ${2:-master}
}

sshq(){
  cd ~/.ssh
  ssh ${1}
}

phps(){
  php -S localhost:${1:-1234}
}

noti(){
  terminal-notifier -message ${1:-"Command has been completed!!"}
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

uni(){
  cd ~/University/2020/2_2
}

setrc(){
  vim ~/.${1:-bash}rc
  source ~/.${1:-bash}rc
  echo "😊 ${1:-bash}rc was updated!!"
}
