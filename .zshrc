export PATH=$PATH:/home/lucas/.local/bin

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

setopt promptsubst

zinit snippet OMZL::git.zsh

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

zinit snippet OMZP::colored-man-pages

zinit ice as"completion"
zinit snippet OMZP::docker/_docker

zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma/fast-syntax-highlighting \
                zdharma/history-search-multi-word \

alias us="setxkbmap us -variant intl"
alias br="setxkbmap br -variant abnt2"

# Windows X410 config
export $(dbus-launch)
export LIBGL_ALWAYS_INDIRECT=1

export WSL_VERSION=$(wsl.exe -l -v | grep -a '[*]' | sed 's/[^0-9]*//g')
export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

alias upgrade="sudo apt update && sudo apt -y dist-upgrade && sudo apt autoremove && sudo apt autoclean"

[ -s "/home/lucas/.scm_breeze/scm_breeze.sh" ] && source "/home/lucas/.scm_breeze/scm_breeze.sh"
### End of Zinit's installer chunk

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/lucas/.sdkman"
[[ -s "/home/lucas/.sdkman/bin/sdkman-init.sh" ]] && source "/home/lucas/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
