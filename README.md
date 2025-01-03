## My dotfiles

### My setup:

- Bash
- VIM
- VIM Plugin-Manager [vim-plug](https://github.com/junegunn/vim-plug)
- [Oh-My-Posh for Bash](https://ohmyposh.dev/docs/installation/linux)

### How to install:

Add the following lines to you _.bashrc_:

```
if [[ -d ~/dotfiles ]]; then
    source ~/dotfiles/bash/.bashrc
    return
fi
```
