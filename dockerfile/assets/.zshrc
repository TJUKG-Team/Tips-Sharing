## >>> ZSH >>>
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="_passion_modified"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting z sudo)
source $ZSH/oh-my-zsh.sh
## <<< ZSH <<<

## >>> setting >>>
setopt no_nomatch
## <<< setting <<<

## >>> aliases >>>
alias ll="la"
alias grep_v="grep -v grep | grep"
## <<< aliases <<<
