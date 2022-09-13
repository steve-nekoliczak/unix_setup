# unix_setup

## Installation

```
sudo apt install vim tmux sakura git
git clone https://github.com/steve-nekoliczak/unix_setup.git ~/.unix_setup
pushd ~/.unix_setup
git submodule update --init
~/.unix_setup/file_handler.sh

// While in tmux, enter: Ctrl+Space I
// This will install tmux plugins

git config --global credential.helper store
# Get personal access token (PAT): https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
# use normal username and PAT as password
# both will be saved after first successful use
git config --global core.editor "vim"
```

Type in `ctrl+space ?` while in `tmux` for a list of commands.

## Hotkeys

```
Leader key is Space
Meta key for Mac is Option, elsewhere it is Alt.

Ctrl+<Leader> I       - Install tmux plugins with tpm

Ctrl+<Leader> Ctrl+s  - Save tmux session
Ctrl+<Leader> Ctrl+r  - Restore tmux session

Ctrl+<Leader> R       - Reload ~/.tmux.conf

<Meta>+y              - Create new tab
<Meta>+u              - Go to tab to the left
<Meta>+i              - Go to tab to the right

<Meta>+down arrow     - Split window horizontally
<Meta>+right arrow    - Split window vertically

I'll add more when I have time :)
In the meantime you can check things out in config_files/.tmux.conf
```
