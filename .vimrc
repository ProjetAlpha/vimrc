" WARNING, need ctags for tagbar (sudo apt-get install exuberant-ctags). Default shorcut : F8.

" *** Plugin setup ***
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

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

" *** Autorun nerdTree, quickfix and return to last edit position when opening files ***

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1

au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" au BufAdd,BufNewFile * nested tab sball --- Open every buffer in its own tab

autocmd QuickFixCmdPost [^l]* nested copen
autocmd QuickFixCmdPost    l* nested lwindow

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

nmap <F11> :cclose<cr>
nmap <F12> :copen<cr>

" *** Style and indent ***

set nu
set background=dark
set mouse=a
set ruler
set hlsearch
set incsearch
set listchars=tab:>-
set autowrite
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
colorscheme gruvbox
"syntax enable

" *** Compile shorcut ***

set makeprg=gcc\ -Wall\ -Werror\ -Wextra\ -o\ %<\ %
nnoremap <F4> :make<CR> 

" *** This command open your output in new window. Work with gcc compiler.***

command! -complete=file -nargs=* Run call s:RunShellCommand('./'.<q-args>)
nnoremap<F5> :Run %<CR>

" *** Helper function: truncate file extension and open new tab with your result ***

function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let index = 0
  let tr = 0
  let len = len(a:cmdline)
  while index <= len
	if a:cmdline[index + 1] == '.' && index > 0
		  let tr = index
 	endif
	let index += 1
  endwhile

  let expanded_cmdline = a:cmdline[:tr - len]
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered: '. expanded_cmdline)
  call setline(2, 'Your result below')
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
