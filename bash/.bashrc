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

PATH=~/.local/bin:~/.local/share/gem/ruby/3.3.0/bin:$PATH

# .Net related configuratios:
if [[ -d ~/.dotnet ]]; then
    PATH=~/.dotnet:~/.dotnet/tools:$PATH

    export DOTNET_ROOT=~/.dotnet
    export DOTNET_MULTILEVEL_LOOKUP=1
fi

if [ -f "/usr/share/nvm/init-nvm.sh" ]; then
    source /usr/share/nvm/init-nvm.sh
fi

if command -v oh-my-posh &>/dev/null; then
    eval "$(oh-my-posh init bash --config https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/slimfat.omp.json)"
fi

if [[ -d ~/dotfiles ]]; then
    echo "Initializing VIM from dotfiles repository"
    export VIMINIT="source $HOME/dotfiles/vim/.vimrc"
fi

