To set up this repo, the following steps must be taken: 

 - clone repo into hidden ~/.dev_env/ directory

 - run these commands to get pathogen, a vim plugin manager: 
```
    mkdir -p ~/.dev_env/autoload ~/.dev_env/bundle && \
    curl -LSso ~/.dev_env/autoload/pathogen.vim https://tpo.pe/pathogen.vim
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

 - create symlink for bash profile
 ```
    ln -s ~/.dev_env/bash/bashprofile ~/.bash_profile
 ```

 - create symlink for gdbinit
 ```
    ln -s ~/.dev_env/gdbinit ~/.gdbinit
 ```
