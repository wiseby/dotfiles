# ============================
# Bootstrapping configurations
# ============================

# Replace .bashrc in your home directory with the followong content:
#export DOT_HOME=~/dotfiles
#
#if [[ -d ~/dotfiles ]]; then
#    source ~/dotfiles/bash/.bashrc
#fi

echo "Initializing wisebys custom bash session..."

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'
alias ls='eza'
alias ll='eza -la'

export EDITOR=vim

PATH=~/.local/bin:~/.local/share/gem/ruby/3.3.0/bin:~/bin:$PATH

# PHP related configurations:
if [[ -d ~/.phpbrew ]]; then
    . $HOME/.phpbrew/bashrc
fi

# Bash
if [[ -f /usr/share/bash-completion/bash-completion ]] && $- == *i*; then
    . /usr/share/bash-completion/bash_completion
    complete -cf sudo

    # To make bash-completion to work with sudo commands.
    # Add the following to sudoers file with visudo:
    # Defaults env_keep += "BASH_COMPLETION"
fi

# VIM:
if [[ -d ~/dotfiles ]]; then
    export VIMINIT="source $HOME/dotfiles/vim/.vimrc"
fi

# Ruby:
if [[ -d ~/.rbenv ]]; then
    PATH=~/.rbenv/bin:$PATH
    eval "$(rbenv init - bash)"
fi

# .Net related configuratios:
if [[ -d ~/.dotnet ]]; then
    PATH=~/.dotnet:~/.dotnet/tools:$PATH

    export DOTNET_ROOT=~/.dotnet
    export DOTNET_MULTILEVEL_LOOKUP=1
    
    source ~/dotfiles/bash/utilities.sh
fi

if [ -f "/usr/share/nvm/init-nvm.sh" ]; then
    source /usr/share/nvm/init-nvm.sh
fi

# Oh-My-Posh
if command -v oh-my-posh &>/dev/null; then
    eval "$(oh-my-posh init bash --config $DOT_HOME/bash/my-slimfat.omp.json)"
fi

# Oh-My-Bash
if [[ -d ~/.oh-my-bash ]]; then
    # Path to your oh-my-bash installation.
    export OSH=~/.oh-my-bash

    # ===== Disabled theme, only using the plugins. =====
    # Set name of the theme to load. Optionally, if you set this to "random"
    # it'll load a random theme each time that oh-my-bash is loaded.
    #OSH_THEME="font"

    # Uncomment the following line to use case-sensitive completion.
    # OMB_CASE_SENSITIVE="true"

    # Uncomment the following line to use hyphen-insensitive completion. Case
    # sensitive completion must be off. _ and - will be interchangeable.
    # OMB_HYPHEN_SENSITIVE="false"

    # Uncomment the following line to disable bi-weekly auto-update checks.
    # DISABLE_AUTO_UPDATE="true"

    # Uncomment the following line to change how often to auto-update (in days).
    # export UPDATE_OSH_DAYS=13

    # Uncomment the following line to disable colors in ls.
    # DISABLE_LS_COLORS="true"

    # Uncomment the following line to disable auto-setting terminal title.
    # DISABLE_AUTO_TITLE="true"

    # Uncomment the following line to enable command auto-correction.
    # ENABLE_CORRECTION="true"

    # Uncomment the following line to display red dots whilst waiting for completion.
    COMPLETION_WAITING_DOTS="true"

    # Uncomment the following line if you want to disable marking untracked files
    # under VCS as dirty. This makes repository status check for large repositories
    # much, much faster.
    DISABLE_UNTRACKED_FILES_DIRTY="true"

    # Uncomment the following line if you don't want the repository to be considered dirty
    # if there are untracked files.
    # SCM_GIT_DISABLE_UNTRACKED_DIRTY="true"

    # Uncomment the following line if you want to completely ignore the presence
    # of untracked files in the repository.
    # SCM_GIT_IGNORE_UNTRACKED="true"

    # Would you like to use another custom folder than $OSH/custom?
    # OSH_CUSTOM=/path/to/new-custom-folder

    # To disable the uses of "sudo" by oh-my-bash, please set "false" to
    # this variable.  The default behavior for the empty value is "true".
    OMB_USE_SUDO=true

    # To enable/disable display of Python virtualenv and condaenv
    # OMB_PROMPT_SHOW_PYTHON_VENV=true  # enable
    # OMB_PROMPT_SHOW_PYTHON_VENV=false # disable

    completions=(
        git
        ssh
    )

    aliases=(
        general
    )

    plugins=(
        git
        nvm
        sudo
        dotnet
        bashmarks
    )

    source "$OSH"/oh-my-bash.sh

fi

