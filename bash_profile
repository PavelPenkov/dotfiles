# aliases
alias unittest='bundle exec rake test:units'
alias functest='bundle exec rake test:functionals'
alias brake='bundle exec rake'
alias gls='gls --color'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g='git'
alias dj-start='RAILS_ENV=development script/delayed_job start'
alias dj-restart='RAILS_ENV=development script/delayed_job restart'
alias dj-stop='RAILS_ENV=development script/delayed_job stop'
alias spork='spork &> /dev/null &'
alias spork-kill='kill $(ps -A | grep spork | grep -v grep | cut -f2,2 -d" ")'

function newproj()
{
  if [ ! -d $1 ]
  then
    mkdir $1
  fi
  cd $1
}

hash pbcopy &> /dev/null
if [ $? -eq 1 ]; then
  alias pbcopy='xsel  --clipboard --input'
fi

hash pbpaste &> /dev/null
if [ $? -eq 1 ]; then
  alias pbpaste='xsel  --clipboard --output'
fi

# my scripts
PATH=/usr/local/bin:$PATH:$HOME/.bin

# git
source "$HOME/dotfiles/git-completion.sh"
export GIT_PS1_SHOWDIRTYSTATE=1

# node.js
export NODE_PATH="/usr/local/lib/node_modules"

PS1='\e[01;96m\u@\h:\e[01;93m\w\e[00;39m $(__git_ps1 "(%s)")\n\$ '

export LS_COLORS="rs=0:di=01;36:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"

ssh-add &> /dev/null
# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# nvm 
# [[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh" && nvm alias default 0.8.2 > /dev/null && nvm use default > /dev/null
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh" && nvm use v0.8.2 > /dev/null

# ww
function ww-deploy()
{
  if [[ -d "ContryClient" ]]
  then
    cd ContryClient
    APP_ENV=ww_local_development rake deploy_ww $@
    cd ..
  elif [[ -d "../ContryClient" ]]
  then
    curr=`pwd`
    cd ../ContryClient
    APP_ENV=ww_local_development rake deploy_ww $@
    cd $curr
  fi
}

function ww-spec()
{
  APP_ENV="ww_test" spec $@
}

function ww-rspec()
{
  APP_ENV="ww_test" rspec $@
}

function ww-rake()
{
  APP_ENV="ww_local_development" rake $@
}

alias ww-console="APP_ENV=ww_local_development bin/console"

#Local bash_profile
[[ -s "$HOME/.bash_profile.local" ]] && source $HOME/.bash_profile.local

[ -s "/home/synapse/.dnx/dnvm/dnvm.sh" ] && . "/home/synapse/.dnx/dnvm/dnvm.sh" # Load dnvm
if [ -e /home/synapse/.nix-profile/etc/profile.d/nix.sh ]; then . /home/synapse/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
