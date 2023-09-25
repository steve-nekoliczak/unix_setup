# unix_setup

## Installation

```
pacman -S base base-devel chromium dhcpcd efibootmgr grub iwd linux linux-firmware man-db neovim plasma-meta sakura the_silver_searcher tmux xclip xorg-xinit yay zsh

git clone https://github.com/steve-nekoliczak/unix_setup.git ~/.unix_setup

// Symlink files from config_files to their correct dirs
~/.unix_setup/file_handler.sh

// Install Plugin Managers for tmux and neovim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

// While in tmux, enter: Ctrl+Space I
// This will install tmux plugins listed in .tmux.conf

// While in nvim, enter: :PlugInstall
// This will install nvim plugins listed in init.lua

git config --global credential.helper store
git config --global core.editor "nvim"

// Get personal access token (PAT): https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
// use normal username and PAT as password
// both will be saved after first successful use
```

Type in `ctrl+space ?` while in `tmux` for a list of commands.

## tmux Hotkeys

Check out `config_files/.tmux.conf` for more info

```
Prefix is Ctrl+Space
Meta key for Mac is Option, elsewhere it is Alt.

<Prefix> I        - Install tmux plugins with tpm
<Prefix> R        - Reload ~/.tmux.conf

<Prefix> Ctrl+s   - Save tmux session
<Prefix> Ctrl+r   - Restore tmux session

<Prefix> u        - Swap tab left
<Prefix> i        - Swap tab right
<Prefix> {        - Swap pane left
<Prefix> }        - Swap pane right

<Meta>+y          - Create new tab
<Meta>+u          - Go to tab left
<Meta>+i          - Go to tab right

<Meta>+down       - Split window horizontally
<Meta>+right      - Split window vertically
```
