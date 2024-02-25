# TODO
# - Increase .bash_history size
#

#=================#
# Command aliases #
# ================#

# Command: halp
# Description: Print help message for this file
alias halp="echo '\
prt <file>          - Print text file to default printer \n
wg                        - wordgrinder \n
'"

# Command: prt
# Description: Print text file to default printer.
# Usage: prt <file>
alias prt='lp -o media=a4 -o cpi=12 -o lpi=7.2 -o page-left=48 -o page-right=48 -o page-top=48 -o page-bottom=48 < '

# Command: wg
# Description: Shortens the wordgrinder command
# Usage: wg
alias wg=wordgrinder

# Convert Wordgrinder files to PDF
# Requirements: libreoffice
# Usage: wgprint <filename>
# Example: wgpring myFile.wg
wgprint() {
    local wgFile="$1"
    wordgrinder -c $wgFile tempWGFile.odt
    libreoffice --convert-to pdf tempWGFile.odt

    prt tempWGFile.pdf
    rm tempWGFile.odt tempWGFile.pdf
}

# Give some default flags to ls
# Command: ls
# Description: Give some default flags to ls.
#              -G    in long listing, don't print group names
#              -F    append indicator (one of */=>@|) to entries
#              -h    print human-readable file sixes
# Usage: ls
alias ls='ls -GFh'

# Command: diff
# Description: Make diff better
# Usage: diff
alias diff='diff --color'

# Command: axel
# Description: Make axel better
# Usage: axel <filename>
alias axel='axel -a'

# Command dmesg
# Description: Make dmesg better
# Usage: dmesg
alias dmesg='dmesg -wH'

# Command: weather
# Description: Get weather reports
# Usage: weather
alias weather='curl wttr.in/?n?p?2'

# Command: bc
# Description: Improved bc calculator
# Usage: bc
alias bc='bc -lq'

# Command: update
# Description: Update system with a single command. 
# Usage: update
alias update="echo 'Updating system via apt-get'; sudo apt-get update; sudo apt-get dist-upgrade; sudo apt-get autoremove"

# Define colors to use in terminal
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# set PATH to include a ~/bin/ directory
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# Export paths for the go language
export GOPATH=~/gocode
export PATH=$PATH:$GOPATH/bin

# Export path for PlatformIO on Visual Studio Code
export PATH=$PATH:~/.platformio/penv/bin

# Export the opencm3 directory
export OPENCM3_DIR=~/lib/libopencm3/

# MacPorts Installer addition on 2016-08-06_at_18:23:46: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/charles/gocode/bin:/home/charles/gocode/bin:/home/charles/gocode/bin:/usr/local/go/bin:/home/charles/gocode/bin:/usr/local/go/bin:/snap/bin
export GOPATH=~/gocode
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/charles/.platformio/penv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/charles/.platformio/packages/tool-openocd-gd32v/bin:/home/charles/.platformio/penv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/charles/.platformio/penv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/charles/.platformio/packages/tool-openocd-gd32v/bin
