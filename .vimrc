" super cool vimrc

set nocompatible
"filetype off

"vundle nonsense
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin list, vundle first
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/syntastic'
"Plugin 'dougireton/vim-chef'
Plugin 'vimwiki/vimwiki'
Plugin 'momota/cisco.vim'
Plugin 'mhinz/vim-rfc'
Plugin 'mhinz/vim-startify'
Plugin 'markabe/vim-jira-open'
Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'hashivim/vim-terraform'

"end vundle nonsense
call vundle#end()
filetype plugin indent on
 
 "statusline fun
 set laststatus=2
 set statusline=%<%f\    " Filename
 set statusline+=%w%h%m%r " Options
 set statusline+=%{HasPaste()} "paste info
 set statusline+=\ [%{&ff}/%Y]   " filetype
 set statusline+=\ [%{CurDir()}] " current dir
 set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*
 set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info

" Filetype plugin
syntax on
" Set to autoread when a file is changed from the outside
set autoread
" Always show cursor position
set ruler
" When both of these are on, vim only pays attention to case in
" searches when
" a capital is present
set ignorecase
set smartcase
" Highlight all search pattern matches
set hlsearch
" Am I in insert or command?
set showmode
" Show matching parens braces etc
set showmatch
" Blink 2/10'th of a second on matching braces
set mat=2
" Expand tabs out to spaces
set expandtab
" Two spaces to be exact
set shiftwidth=2
" Tabs are also two space width (may cause issues with python without
" filetype
" indent on
set tabstop=2
" Line numbers
set number
" We don't need annoying backup files
set nobackup
set nowritebackup
" Or annoying swp files. Especially swp files.
set noswapfile
" If the file on disk changes, reload it
set autoread
" Yank to the system clipboard register by default
set clipboard=unnamed
" Always show the status line
set laststatus=2
" Sets color of search results
hi Search ctermbg=white


"vim-jira-open
"sanitized

"startify
let g:startify_bookmarks = [
      \ { 'c': '~/vimwiki/index.wiki' },
      \ ]

 " F2 toggles paste mode
 set pastetoggle=<F2>
 " F3 turns syntax on numbers on and runs a syntax check
 map <F3> :syntax on<cr>:set number<cr>":SyntasticCheck<cr>
 " F4 turns syntax off numbers off and removes the syntastic sign
 " gutter
 map <F4> :syntax off<cr>:set nonumber<cr>:sign unplace *<cr>
  


"" Macros
" Capital W saves the file with sudo
command W w !sudo tee % > /dev/null

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe
"normal! g'\"" | endif
  
"" Functions

" Function to display current directory, (translates /home/xyz to ~)
function! CurDir()
  let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction
     
" Function to determine whether paste mode is enabled
function! HasPaste()
  if &paste
    return '[PASTE]'
      else
    return ''
  endif
endfunction
    
