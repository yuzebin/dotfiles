# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="random"
ZSH_THEME="tjkirch_mod"
#ZSH_THEME="bira"

DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=29
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# plugins=(colored-man-pages colorize docker docker-compose emoji-clock gem git-flow-avh git-hubflow postgres npm lein jsontools httpie heroku redis-cli rvm sublime urltools vagrant vi-mode )
plugins=(redis-cli heroku docker colorize git postgres httpie git-flow)
# plugins=()

# run on-my-zsh
source $ZSH/oh-my-zsh.sh

# path for bin
export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/sbin:/usr/bin:$PATH

# path for ctags
export PATH=$PATH:/usr/local/Cellar/ctags/5.8/bin

# path for rust
export PATH=$PATH:/usr/local/Cellar/rust/1.0.0/bin

# path for texlive
export PATH=$PATH:/usr/local/texlive/2013/bin/universal-darwin

# path for python2.7 
# export PATH=$PATH:/usr/local/lib/python2.7/site-packages

# java_home
export JAVA_HOME="$(/usr/libexec/java_home -v 1.7)"

# path for android
export PATH=$PATH:/Users/yuzebin/Library/Android/sdk/tools
export PATH=$PATH:/Users/yuzebin/Library/Android/sdk/platform-tools
export ANDROID_HOME=/Users/yuzebin/Library/Android/sdk

# path for elixir
export PATH=$PATH:/Users/yuzebin/source/erlang/elixir/bin

# path for ruby
export GEMS=/Users/yuzebin/.rvm/gems
export RUBY21=$GEMS/ruby-2.1.5
export RUBY23=$GEMS/ruby-2.3.0

export PATH=$RUBY21/bin:$HOME/.rbenv/shims:$RUBY23/bin:$PATH 

# for docker toolbox
export DOCKER_HOST=tcp://192.168.99.100:2376
export DOCKER_CERT_PATH=/Users/yuzebin/.docker/machine/certs
export DOCKER_TLS_VERIFY=1

export GOPATH=/usr/local/Cellar/go/1.5.2/libexec/bin

alias rvm-prompt=$HOME/.rvm/bin/rvm-prompt
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# display a quote
fortune 30% quote 30% rework 10% tangshi 10% songci 10% yuanqu 5% joel-on-software 5% shlomif 

# command to add a new quote
quote=/usr/local/Cellar/fortune/9708/share/games/fortunes/quote
qadd()
{
    echo "%" >> $quote
    echo $1 >> $quote
    echo "" >> $quote
    rm -f $quote.dat
    strfile $quote
}

proxyon()
{
    export ALL_PROXY=socks5:127.0.0.1:1080
    export http_proxy=http://127.0.0.1:8123
    export https_proxy=http://127.0.0.1:8123
}
proxyoff()
{
    export ALL_PROXY=
    export http_proxy=
    export https_proxy=
}

# some alias for convinient
alias cp="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress"
alias ex="elixir"
alias rm=rmtrash
alias vg="vagrant"
alias cat="ccat"
alias dog="ccat"
alias scp="rsync -avrzPS"
alias apkt="java -jar /usr/bin/apktool.jar"
alias assh="/usr/local/bin/autossh -M 0"
alias diff="/usr/local/bin/ksdiff"
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
alias lsport="lsof -P -i -n"

# some alias for git
alias glog="git log --oneline | nl -v0 | sed 's/^ \+/&HEAD~/'"

# viriable for byobu
export BYOBU_PREFIX=$(brew --prefix)

# little function 
mcd() { mkdir -p "$1"; cd "$1";}
md5()  { md5sum "$1" | grep "$2";}
zbrot(){ echo `echo $1 | base64 --decode` | tr '[A-Za-z]' '[N-ZA-Mn-za-m]' }
zbrote(){ echo "$1" | tr '[A-Za-z]' '[N-ZA-Mn-za-m]' | base64 }
imgb64(){echo "data:image/jpeg;base64,$(base64 $1)"}

# alias for pyenv
pyinit() { eval "$(pyenv init -)";}
alias py2="pyinit && pyenv activate py27"
alias py3="pyinit && pyenv activate py35"
alias pydeact="pyenv deactivate"

# alias for json
alias jsonv='xargs -0 node -e "try {json = JSON.parse(process.argv[1]);} catch (e) { console.log(false); json = null;  } if(json) { console.log(true);  }"'
alias jsonp='xargs -0 node -e "console.log(JSON.stringify(JSON.parse(process.argv[1]), null, 4));"'

# alias for pgsql
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias pg_status='pg_ctl status -D /usr/local/var/postgres -s'
alias pg_reload='pg_ctl reload -D /usr/local/var/postgres -s'
alias pg_restart='pg_stop && sleep 1 && pg_start'

# alias for urlencode
alias urldec='node -e "console.log(decodeURIComponent(process.argv[1]))"'
alias urldec_json='xargs -0 node -e "console.log(decodeURIComponent(process.argv[1]))"'
alias urlenc='node -e "console.log(encodeURIComponent(process.argv[1]))"'
alias urlenc_json='xargs -0 node -e "console.log(encodeURIComponent(process.argv[1]))"'

# alias for docker
DK_PATH=/Users/yuzebin/zdata:/var/zdata
alias dk="docker"
alias dkf="docker search --no-trunc"
alias dkimg="docker images"
alias dkrun="docker run -it -v $DK_PATH "
alias dkpid="sudo docker inspect --format '{{.State.Pid}}'"
alias dkip="sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dkps="docker ps"
alias dkpsa="docker ps -a"
alias dkrm="docker rm"
alias dkrmi="docker rmi"

alias dkc="docker-compose"
alias dkm="docker-machine"
alias dks="docker-swarm"

#the implementation refs from https://github.com/jpetazzo/nsenter/blob/master/docker-enter
function dken() {
    #if [ -e $(dirname "$0")/nsenter ]; then
    #Change for centos bash running
    if [ -e $(dirname '$0')/nsenter ]; then
        # with boot2docker, nsenter is not in the PATH but it is in the same folder
        NSENTER=$(dirname "$0")/nsenter
    else
        # if nsenter has already been installed with path notified, here will be clarified
        NSENTER=$(which nsenter)
        #NSENTER=nsenter
    fi
    [ -z "$NSENTER" ] && echo "WARN Cannot find nsenter" && return

    if [ -z "$1" ]; then
        echo "Usage: `basename "$0"` CONTAINER [COMMAND [ARG]...]"
        echo ""
        echo "Enters the Docker CONTAINER and executes the specified COMMAND."
        echo "If COMMAND is not specified, runs an interactive shell in CONTAINER."
    else
        PID=$(sudo docker inspect --format "{{.State.Pid}}" "$1")
        if [ -z "$PID" ]; then
            echo "WARN Cannot find the given container"
            return
        fi
        shift

        OPTS="--target $PID --mount --uts --ipc --net --pid"

        if [ -z "$1" ]; then
            # No command given.
            # Use su to clear all host environment variables except for TERM,
            # initialize the environment variables HOME, SHELL, USER, LOGNAME, PATH,
            # and start a login shell.
            #sudo $NSENTER "$OPTS" su - root
            sudo $NSENTER --target $PID --mount --uts --ipc --net --pid su - root
        else
            # Use env to clear all host environment variables.
            sudo $NSENTER --target $PID --mount --uts --ipc --net --pid env -i $@
        fi
    fi
}
