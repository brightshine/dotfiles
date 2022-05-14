source /home/hsiehd/.antigen.zsh

# Load oh-my-zsh library
antigen use oh-my-zsh

# Load bundles from the default repo (oh-my-zsh)
antigen bundle autojump
antigen bundle command-not-found
antigen bundle completion
antigen bundle docker
antigen bundle fd
antigen bundle fzf
antigen bundle git
antigen bundle history
antigen bundle sudo
antigen bundle tmux

# Load bundles from external repos
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jeffreytse/zsh-vi-mode

# Select theme
antigen theme maran

# Apply antigen
antigen apply


setopt histignorealldups sharehistory

# Use vi keybindings even if our EDITOR is set to vi
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export TERM=xterm-256color
#export TERM=tmux-256color

export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
        nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
        -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
        -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

export NAVKIT_DATASET="~/Perforce/hsiehd_tw1lxl-400511_9212/depot-open/playground/bitr/navkit_qb_resources"
#export QT_PLUGIN_PATH=/usr/local/pkg/qt/qt-5.6.3/5.6.3/gcc_64/plugins

source ~/.alias

# Turn off all beeps
unsetopt BEEP

path+=('/home/hsiehd/src/devutils/NavKit')

export JAVA_HOME="/usr/local/pkg/java/adoptopenjdk8-bin"
export PATH=/usr/local/pkg/bin:/usr/local/pkg/sbin:/usr/local/pkg/gcc/bin:/home/hsiehd/Qt5.12.7/Tools/QtCreator/bin:/home/hsiehd/src/diff-so-fancy:$PATH
#export PATH=/home/hsiehd/Qt5.12.7/Tools/QtCreator/bin:$PATH

