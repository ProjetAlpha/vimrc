" WARNING, need ctags for tagbar (sudo apt-get install exuberant-ctags). Default shorcut : F8.

" *** Plugin setup ***
set rtp+=$HOME/.vim/bundle/Vundle.vim/ " MAC: ~/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/') " MAC: vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on

" *** Autorun nerdTree, open every buffer in its own tabpage and return to last edit position when opening files***
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

au BufAdd,BufNewFile * nested tab sball

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" *** Shortcuts ***
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
map <C-b> :NERDTreeClose<CR>

nmap <leader>w :w!<cr>
nmap <F8> :TagbarToggle<CR>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" *** Style and indent ***
set nu
set background=dark
set mouse=a
set expandtab
set smarttab
set ruler
set ai
set si
set shiftwidth=4
set tabstop=4
set wrap
set so=7
set wildmenu
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set smartcase
set hlsearch
set incsearch
set listchars=tab:>-
set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor
hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222

" syntax enable
colorscheme gruvbox
