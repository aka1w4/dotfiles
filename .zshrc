plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

alias ll="ls -lah"
alias la='ls -A'
alias l='ls -CF'
alias gs="git status"
alias ..="cd .."
alias il2cppdump='mono /etc/hdd/reverse/ilcppdumper/Il2CppDumper.exe'

setopt autocd
setopt histignoredups
setopt sharehistory
setopt no_beep

source $ZSH/oh-my-zsh.sh
if [ -f "$ZSH/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source $ZSH/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f "$ZSH/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source $ZSH/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggeslltions.zsh
fi

eval "$(starship init zsh)"
