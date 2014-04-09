ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git osx rbenv vagrant golang)

export LC_ALL=en_US.UTF-8
export LANG=en_US.utf8
export EDITOR=vim
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$HOME/CocoaPods/bin:$GOROOT/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/share/npm/lib/node_modules/phantomjs/lib/phantom/bin:$PATH

source $ZSH/oh-my-zsh.sh

bindkey -v
export KEYTIMEOUT=1

vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
# Thanks Ron! (see comments)
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}

RPROMPT='${vim_mode}'
