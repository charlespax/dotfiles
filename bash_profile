# Define colors to use in terminal
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Give some default flags to ls
alias ls='ls -GFh'

# set PATH to include a ~/bin/ directory
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# Export the opencm3 directory
export OPENCM3_DIR=~/lib/libopencm3/

# MacPorts Installer addition on 2016-08-06_at_18:23:46: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

