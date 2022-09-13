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
git config --global core.editor "vim"

# Get personal access token (PAT): https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
# use normal username and PAT as password
# both will be saved after first successful use
```

Type in `ctrl+space ?` while in `tmux` for a list of commands.

## Hotkeys

Check out in `config_files/.tmux.conf` for more info

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
