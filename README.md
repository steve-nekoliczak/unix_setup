# unix_setup

## Installation

```
sudo apt install vim tmux sakura git
git clone https://github.com/steve-nekoliczak/unix_setup.git ~/.unix_setup
git submodule update --init
~/.unix_setup/file_handler.sh

git config --global credential.helper store
# Get personal access token (PAT): https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
# use normal username and PAT as password
# both will be saved after first successful use
git config --global core.editor "vim"
```

Type in `ctrl+space ?` while in `tmux` for a list of commands.
