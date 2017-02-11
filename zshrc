# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="synapse"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails heroku git-flow ubuntu)

source $ZSH/oh-my-zsh.sh

# Aliases
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
alias gph='git push heroku master'
alias rr='rake routes | less'
alias fs='foreman start'
alias apt-list='dpkg --get-selections | grep'
alias lcurl='http_proxy="" curl'
alias jscurl='lcurl -H "Accept: application/json" -H "Content-Type: application/json"'
alias xcurl='http_proxy="" curl -H "Accept: application/xml" -H "Content-Type: application/xml"'
alias yard-reload='launchctl unload /Users/synapse/Library/LaunchAgents/penkov.me.yard.plist && launchctl load /Users/synapse/Library/LaunchAgents/penkov.me.yard.plist'
alias ffs='sudo $(fc -ln -1)'
alias be='bundle exec'
alias rconsole='bundle exec spring rails console'
alias sspec='bundle exec spring rspec'
alias sserver='bundle exec rails server'
alias sconsole='bundle exec spring rails console'
alias sqlplus="rlwrap -i -f ~/.sqlplus_history -H ~/.sqlplus_history -s 30000 sqlplus"

hash pbcopy &> /dev/null
if [ $? -eq 1 ]; then
  alias pbcopy='xsel  --clipboard --input'
fi

hash pbpaste &> /dev/null
if [ $? -eq 1 ]; then
  alias pbpaste='xsel  --clipboard --output'
fi

# Needed for XFCE
export TERM=xterm-256color

# my scripts
PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:$HOME/.bin:/usr/local/share/npm/bin:$PATH

# functions
source "$HOME/.functions.zsh"

export EDITOR='/usr/bin/vim'
export BUNDLER_EDITOR='/usr/bin/vim'

eval "$(rbenv init -)"
setopt globdots

# Oracle stuff
export NLS_LANG=AMERICAN_AMERICA.CL8MSWIN1251

# local
[[ -s "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[ -s "/home/synapse/.dnx/dnvm/dnvm.sh" ] && . "/home/synapse/.dnx/dnvm/dnvm.sh" # Load dnvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
