# vimrc

Custom vimrc.

## Installation
  
  1.  Copy raw .vimrc file. Then, run `vim ~/vimrc` and paste the raw file.
 
  2. `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
      
      Launch vim and run `:PluginInstall`
  
  3. If ctags is not installed 
     
     `sudo apt-get install exuberant-ctags`
## Usage
  
    CTRL + N : NERDTreeToggle. 
    CTRL + B : NERDTreeClose.
  
    If you need to add or remove a file with NERD type m.
  
    CTRL + P : search your file in current directory.
    
    F4 : compile your current file and open quickfix window (gcc -Wall -Werror -Wextra -o filename filname.c).
    F5 : display your output file in a new bottom window (execute a shell command : ./filename).
    F8 : TagBarToggle.
    F12 : open quickfix (error window). 
    F11 : close quickfix (error window).
    
    tn = :tabnew 
    to = :tabonly
    tc = :tabclose
    tm = :tabmove
    t = :tabnext
    
    You can make any git command with vim.
      - :Gstatus
      - :Glog
      - :Git add .
      - :Git push
      ...
      
