# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="random"
ZSH_THEME="tjkirch_mod"
#ZSH_THEME="bira"
#
DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=29
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(encode64 git urltools colored-man jsontools web-search)

# run on-my-zsh
source $ZSH/oh-my-zsh.sh

# run .bashrc_docker
source ~/.bashrc_docker

# path for bin
export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/sbin:/usr/bin:$PATH

# path for ctags
export PATH=$PATH:/usr/local/Cellar/ctags/5.8/bin

# path for rust
export PATH=$PATH:/usr/local/Cellar/rust/1.0.0/bin

# path for texlive
export PATH=$PATH:/usr/local/texlive/2013/bin/universal-darwin

# path for python2.7 
export PATH=$PATH:/usr/local/lib/python2.7/site-packages

# java_home
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# path for android
export PATH=$PATH:/Users/yuzebin/Library/Android/sdk/tools
export PATH=$PATH:/Users/yuzebin/Library/Android/sdk/platform-tools
export ANDROID_HOME=/Users/yuzebin/Library/Android/sdk

# path for elixir
export PATH=$PATH:/Users/yuzebin/source/erlang/elixir/bin

# path for ruby
export PATH=$HOME/.rbenv/shims:/Users/yuzebin/.rvm/gems/ruby-2.1.5/bin:$PATH 

# initial pyenv virtualenv environment
eval "$(pyenv init -)"

# for docker toolbox
export DOCKER_HOST=tcp://192.168.99.100:2376
export DOCKER_CERT_PATH=/Users/yuzebin/.docker/machine/certs
export DOCKER_TLS_VERIFY=1

alias rvm-prompt=$HOME/.rvm/bin/rvm-prompt
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# display a quote
fortune 30% quote 30% rework 10% tangshi 10% songci 10% yuanqu 5% joel-on-software 5% shlomif 

# command to add a new quote
quote=/usr/local/Cellar/fortune/9708/share/games/fortunes/quote
quoteadd()
{
    echo "%" >> $quote
    echo $1 >> $quote
    echo "" >> $quote
    rm -f $quote.dat
    strfile $quote
}

alias rm=rmtrash
alias rmit="/bin/rm -rf"

alias cp="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress"
alias cpit="/bin/cp"

alias assh="/usr/local/bin/autossh -M 0"

# some alias for convinient
alias ex="elixir"
alias dk="docker"
alias vg="vagrant"
alias dkc="docker-compose"
alias dkm="docker-machine"
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
alias lsport="lsof -P -i -n"
alias p4diff="/usr/local/bin/ksdiff"
alias apktool="java -jar /usr/bin/apktool.jar"
alias randpass="pwgen -Bcny 20"

# some alias for git
alias glog="git log --oneline | nl -v0 | sed 's/^ \+/&HEAD~/'"

# path for docker 
export DK_PATH=/Users/yuzebin/zdata:/var/zdata
alias dkrun="dk run -it -v $DK_PATH "

export BYOBU_PREFIX=$(brew --prefix)

mkcd() { mkdir -p "$1"; cd "$1";}
md5()  { md5sum "$1" | grep "$2";}
zbrot(){ echo `echo $1 | base64 --decode` | tr '[A-Za-z]' '[N-ZA-Mn-za-m]' }
zbrote(){ echo "$1" | tr '[A-Za-z]' '[N-ZA-Mn-za-m]' | base64 }

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.10/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Applications/Cocos/Cocos2d-x
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.10/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH
