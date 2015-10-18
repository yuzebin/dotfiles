# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="random"
DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=29
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(encode64 git urltools colored-man docker docker-compose)

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

# path for android
export PATH=$PATH:/Users/yuzebin/Library/Android/sdk/tools
export PATH=$PATH:/Users/yuzebin/Library/Android/sdk/platform-tools
export ANDROID_HOME=/Users/yuzebin/Library/Android/sdk

# path for elixir
export PATH=$PATH:/Users/yuzebin/source/erlang/elixir/bin

# path for ruby
export PATH=/Users/yuzebin/.rvm/gems/ruby-2.1.5/bin:$PATH 

# for boot2docker
export DOCKER_HOST=tcp://192.168.59.104:2376
export DOCKER_CERT_PATH=/Users/yuzebin/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# zebin's environment
export ZEBIN_SRC="/Volumes/HD500G/Users/yuzebin/Documents/mbp13_sync/zebin_src"

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

# command to chg rm
function rmtrick()
{
    filetail=`date +%Y%m%d%H%M%S`
    pwdlen=$((${#HOME}+1))
    subdir=`pwd|cut -c $pwdlen-`
    mkdir -p ~/.filehis/$subdir
    for f in $*
    do
        mv $f ~/.filehis/$dir/$f.$filetail
    done
}
alias rm=rmtrick
alias rmit="/bin/rm -rf"

# alias for filetype
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s zip='unzip'

alias -s py='vim'
alias -s pl='vim' 
alias -s rb='vim'
alias -s php='vim'
alias -s js='vim'
alias -s css='vim'
alias -s html='vim'
alias -s clj='vim'
alias -s lsp='vim' 
alias -s conf='vim'
alias -s c='vim'
alias -s h='vim'
alias -s mm='vim'
alias -s cpp='vim'
alias -s hpp='vim'
alias -s java='vim'

# some alias for convinient
alias ex="elixir"
alias dk="docker"
alias vg="vagrant"
alias de="docker-enter"
alias dm="docker-machine"
alias dc="docker-compose"
alias psg="ps aux|grep"
alias b2d="boot2docker"
alias subl="/usr/bin/subl"
alias myip="curl ifconfig.me"
alias histg="history|grep "
alias lsport="lsof -P -i -n"
alias p4diff="/usr/local/bin/ksdiff"
alias apktool="java -jar /usr/bin/apktool.jar"
alias randpass="pwgen -Bcny 20"

# path for docker 
export DK_PATH=/Users/yuzebin/zdata:/var/zdata
alias dkrun="dk run -it -v $DK_PATH "

export BYOBU_PREFIX=$(brew --prefix)

bak()  { cp "$1"{,.bak};}
cdls() { cd "$1"; ls;}
mkcd() { mkdir -p "$1"; cd "$1";}
md5()  { md5sum "$1" | grep "$2";}
