# unix_setup

## Installation

[Install Ubuntu Desktop](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview).

After Ubuntu installation:
```
sudo apt install git kitty neovim silversearcher-ag tmux xclip zsh
```

After installation:
```
git clone https://github.com/steve-nekoliczak/unix_setup.git ~/.unix_setup
// Symlink files from config_files to their correct dirs
~/.unix_setup/file_handler.sh
```

Install Plugin Managers for tmux:
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

While in `tmux`, enter: `Ctrl+Space I` to install plugins listed in `config_files/.tmux.conf`.

Configure git:
```
git config --global credential.helper store
git config --global core.editor "nvim"
```
Get personal access token (PAT): https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
Use normal username and PAT as password.
Both will be saved after first successful use.

## NeoVim Setup

Install `vim-plug` plugin manager
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Install neovim plugins listed in `config_files/init.lua` by running this command while in neovim:
```
:PlugInstall
```

Install Node and NPM since the CoC plugin needs them:
```
sudo apt install nodejs npm
```

Install language servers CoC requires:
```
sudo pacman -S mono mono-msbuild    // Language server for C#
gem install solargraph              // Language server for Ruby
```

Install GHCup to install `haskell-language-server`:
```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

Install CoC plugins for those language servers.
See list of language servers here: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
While in neovim:
```
:CocInstall coc-omnisharp           // Installs C# language server
:CocInstall coc-solargraph          // Installs Ruby language server
:CocInstall coc-hls                 // Installs Haskell Language Server
```

## tmux Hotkeys

Type in `ctrl+space ?` while in `tmux` for a list of commands.

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
