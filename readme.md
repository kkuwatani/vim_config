To set up this repo, the following steps must be taken: 

 - clone repo into hidden ~/.dev_env/ directory

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
 
 - create symlink for vimrc 
 ```
    ln -s ~/.dev_env/vimrc ~/.vimrc
 ```
 
 - create symlink for tmux conf 
 ```
    ln -s ~/.dev_env/tmuxconf ~/.tmux.conf
 ```

 - create symlink for shell profile for bash
 ```
    ln -s ~/.dev_env/shell/bashprofile ~/.bash_profile
 ```
 - OR for zsh
 ```
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
