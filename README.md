To set up this repo, the following steps must be taken: 

 - clone repo into hidden ~/.dev_env/ directory
 ```
 cd ~
 git clone ...
 mv vim_config .dev_env
 ```

 - run these commands to get pathogen, a vim plugin manager: 
```
    mkdir -p ~/.dev_env/autoload ~/.dev_env/bundle && \
    curl -LSso ~/.dev_env/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

 - if pathogen is not working, please make make a symlink for `dev_env`:
 ```
    ln -s ~/.dev_env ~/.vim
 ```

 - init git submodules for pathogen vim plugins
 ```
 git submodule init
 git submodule update
 ```
 
 - create symlink for vimrc 
 ```
    ln -s ~/.dev_env/vimrc ~/.vimrc
 ```
 
 - create symlink for tmux conf 
 ```
    ln -s ~/.dev_env/tmuxconf ~/.tmux.conf
 ```

 - create symlink for shell profile for bash or for zsh
 ```
    ln -s ~/.dev_env/shell/bashprofile ~/.bash_profile

    OR

    ln -s ~/.dev_env/shell/zshrc ~/.zshrc
 ```

 - create symlink for gdbinit
 ```
    ln -s ~/.dev_env/gdbinit ~/.gdbinit
 ```

 - For tmux to clipboard copy-paste, you will need:
 ```
    brew install reattach-to-user-namespace
 ```

 - Install and link macvim for clang-formatter to work:
 ```
    brew install clang-format
    brew install macvim
    brew link macvim
 ```

 - Install fzf for fzf vim plugin:
 ```
    brew install fzf
 ```

 - Unrelated, but you'll want to setup python and virtualenvs:
 ```
    brew install python
    pip3 install virtualenvwrapper
 ```
