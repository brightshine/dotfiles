source /home/hsiehd/.antigen.zsh

# Load oh-my-zsh library
antigen use oh-my-zsh

# Load bundles from the default repo (oh-my-zsh)
antigen bundle autojump
antigen bundle command-not-found
antigen bundle completion
antigen bundle fd
antigen bundle fzf
antigen bundle git
antigen bundle history
antigen bundle sudo
antigen bundle tmux
antigen bundle themes
antigen-bundle Tarrasch/zsh-bd

# Load bundles from external repos
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jeffreytse/zsh-vi-mode

# Select theme
antigen theme maran
#antigen theme flazz
#antigen theme apple
#antigen theme eastwood
#antigen theme simple
#antigen theme lukerandall

# Apply antigen
antigen apply


setopt histignorealldups sharehistory

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
ZVM_VI_EDITOR='/usr/local/bin/nvim'

EDITOR='/usr/local/bin/nvim'
# Use vi keybindings even if our EDITOR is set to vi
bindkey -v

HISTFILE=~/.zsh_history

export TERM=xterm-256color
#export TERM=tmux-256color

export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
        nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
        -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
        -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

export NAVKIT_DATASET="/home/hsiehd/Perforce/hsiehd_tw1lxl-400511_9212/depot-open/playground/bitr/navkit_qb_resources"
#export NAVKIT_DATASET="~/Maps/Lite"
#export QT_PLUGIN_PATH=/usr/local/pkg/qt/qt-5.6.3/5.6.3/gcc_64/plugins

source ~/.alias

# Turn off all beeps
unsetopt BEEP

path+=('/home/hsiehd/src/devutils/NavKit')

export JAVA_HOME="/usr/local/pkg/java/adoptopenjdk8-bin"
export PATH=/usr/local/pkg/bin:/usr/local/pkg/sbin:/usr/local/pkg/gcc/bin:/home/hsiehd/Qt5.12.7/Tools/QtCreator/bin:/home/hsiehd/src/diff-so-fancy:$PATH
#export PATH=/home/hsiehd/Qt5.12.7/Tools/QtCreator/bin:$PATH

fpath+=${ZDOTDIR:-~}/.zsh_functions

# Support alias provided by tre
tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }

export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git --color=always'
export FZF_DEFAULT_OPTS="--ansi"
export MESA_LOADER_DRIVER_OVERRIDE='i965'
