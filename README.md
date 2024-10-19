# unix_setup

## Installation

[Install Ubuntu Desktop](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview).

After Ubuntu installation, install the packages we need:
```
sudo apt install git kitty silversearcher-ag tmux xclip zsh
snap install nvim --classic
```

Setup our shell environment:
```
git clone https://github.com/steve-nekoliczak/unix_setup.git ~/.unix_setup
// Symlink files from config_files to their correct dirs
~/.unix_setup/file_handler.sh
```

Install Plugin Managers for `tmux`:
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

While in `tmux`, enter: `Ctrl+Space I` to install plugins listed in `config_files/.tmux.conf`.

Configure `git`:
```
git config --global credential.helper store
git config --global core.editor "nvim"
```
Get personal access token (PAT): https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
Use normal username and PAT as password.
Both will be saved after first successful use.

## NeoVim Setup

Install the `vim-plug` plugin manager
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Install the NeoVim plugins listed in `config_files/init.lua` by running this command while in `nvim`:
```
:PlugInstall
```

Install Node and NPM since the CoC plugin needs them:
```
sudo apt install nodejs npm
```

Install the language servers CoC requires:
```
gem install solargraph              // Language server for Ruby
```

Install GHCup to install `haskell-language-server`:
```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

Install CoC plugins for those language servers.
[See the list of language servers here](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions).

While in `nvim`:
```
:CocInstall coc-solargraph          // Installs Ruby language server
:CocInstall coc-hls                 // Installs Haskell Language Server
:CocInstall coc-godot               // Installs Godotscript language server
```

`:CocInstall coc-elixir` has a bug where it can't install `elixir-ls`, so we need to install `elixir-ls` from source:

https://github.com/elixir-lsp/coc-elixir/issues/46#issuecomment-849725662

```
git clone https://github.com/elixir-lsp/elixir-ls.git ~/.elixir-ls
cd ~/.elixir-ls
mix deps.get && mix compile && mix elixir_ls.release2 -o release
```

`coc-settings.json` already has this path specified, so no more stuff to configure.

Although `coc-elixir` currently can't install `elixir-ls` in our setup, it still has some features we want. To install `coc-elixir` while in `nvim`:

```
:CocInstall coc-elixir
```

## `tmux` Hotkeys

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
