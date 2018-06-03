To set up this repo, the following steps must be taken: 

 - run these commands to get pathogen, a vim plugin manager: 
```
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```
 - init git submodules for pathogen vim plugins
 
 - create symlink for vimrc 
 ```
    ln -s ~/.vim/vimrc ~/.vimrc
 ```
 
 - create symlink for tmux conf 
 ```
    ln -s ~/.vim/tmuxconf ~/.tmux.conf
 ```

 - YouCompleteMe plug in will require buiding (and may need to be used on macvim)
