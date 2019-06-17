# TODO
# - Increase .bash_history size
#


# Define colors to use in terminal
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Give some default flags to ls
alias ls='ls -GFh'

# Make axel better
alias axel='axel -a'

# Make dmesg better
alias dmesg='dmesg -wH'

# Get weather reports
alias weather='curl wttr.in/?n?p?2'

# update system
alias update="echo 'Updating system via apt-get'; sudo apt-get update; sudo apt-get dist-upgrade; sudo apt-get autoremove"

# set PATH to include a ~/bin/ directory
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# Export paths for the go language
export GOPATH=~/gocode
export PATH=$PATH:$GOPATH/bin


# Export the opencm3 directory
export OPENCM3_DIR=~/lib/libopencm3/

# MacPorts Installer addition on 2016-08-06_at_18:23:46: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/charles/gocode/bin:/home/charles/gocode/bin:/home/charles/gocode/bin:/usr/local/go/bin:/home/charles/gocode/bin:/usr/local/go/bin
export GOPATH=~/gocode
export PATH=$PATH:$GOPATH/bin
