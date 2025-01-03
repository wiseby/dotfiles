#
# ~/.bashrc
#

# If not running interactively, don't do anything

echo "Loading dotfiles repository config"

[[ $- != *i* ]] && return

alias grep='grep --color=auto'
alias sudo='sudo '
alias ls='eza'

export BUNDLE_PATH=~/.gems
export GEM_HOME=~/.gems

PATH=~/.local/bin:~/.dotnet:~/.local/share/gem/ruby/3.3.0/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v oh-my-posh &>/dev/null; then
    eval "$(oh-my-posh init bash --config https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/slimfat.omp.json)"
fi

if [[ -d ~/dotfiles ]]; then
    echo "Initializing VIM from dotfiles repository"
    export VIMINIT="source $HOME/dotfiles/vim/.vimrc"
fi

