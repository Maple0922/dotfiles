source /usr/local/Cellar/git/2.24.1/etc/bash_completion.d/git-prompt.sh
source /usr/local/Cellar/git/2.24.1/etc/bash_completion.d/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true

export PS1='\[\e[1;97m\]\# ✍️  \[\e[0;3;32m\]\t \[\e[0;1;34m\]\w\[\e[m\]\[\033[31m\] $(__git_ps1 "(%s) ")\[\033[00m\]$ '

export PATH=$PATH:/Users/futonakajima/.nodebrew/current/bin

source ~/git-completion.bash

alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"

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

sass(){
  node-sass sass/style.scss css/style.css
  node-sass sass/style.scss css/style.css ${1}
}

phps(){
  php -S localhost:${1:-1234}
}

site(){
  open https://Maple0922.github.io/${1}
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
  echo -e \\nPlease make repository named "${1:-newsite}" on github.com and follow the steps below.\\n
  echo "    $ git remote add origin https://github.com/Maple0922/${1:-newsite}"
  echo -e "    $ git push -u origin master\\n"
  echo ${1:-newsite} | pbcopy
  open https://github.com/new
}

ngtemp(){
  cp -f ~/Web/angular-make-template-file/index.html ./src/index.html
  cp -f ~/Web/angular-make-template-file/styles.scss ./src/styles.scss
  cp -f ~/Web/angular-make-template-file/app.component.html ./src/app/app.component.html
  cp -r ~/Web/angular-make-template-file/js ./src/assets/
  cp -r ~/Web/angular-make-template-file/scss ./src/assets/
  cp -r ~/Web/angular-make-template-file/icon ./src/assets/
  rm ./src/favicon.ico
  mkdir ./src/assets/images
}

uni(){
  cd ~/University/2020/2_2
}
vimrc(){
  vim ~/dotfiles/.vimrc
}
bashrc(){
  vim ~/.bashrc
}
npmtmp(){
  npm i -D css-loader file-loader gh-pages sass sass-loader style-loader stylelint stylelint-config-recess-order stylelint-config-standard stylelint-scss stylelint-webpack-plugin url-loader vue webpack webpack-cli webpack-dev-server
}
