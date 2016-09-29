set nocompatible                  " Must come first because it changes other options.
filetype off

"Colour scheme
colorscheme Tomorrow-Night-Eighties
set background=dark

" Format whole file
map <C-f> mzgg=G`z

" Map leader key
let mapleader = ","

" Tab to last buffer to make it easy to go to the last file you were in.
nmap <Tab> :b#<CR>

" Exit Vim quickly
map Q :qa<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Create window splits easier. vv = vsplit, ss = hsplit
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Turn on syntax highlighting.
syntax enable  

" Turn on autoread to watch for changes
set autoread                  

" Fires after you move the cursor and then let it sit still for updatetime
:au CursorHold * checktime 

" Turn on file type detection.
filetype plugin indent on 

" Display incomplete commands.
set showcmd   

" Display the mode you're in.
set showmode   

" Intuitive backspacing.
set backspace=indent,eol,start

" Handle multiple buffers better.
set hidden     

" Enhanced command line completion.
set wildmenu     

" Complete files like a shell.
set wildmode=list:longest      

" Case-insensitive searching.
set ignorecase 

" But case-sensitive if expression contains a capital letter.
set smartcase        

" Show line numbers.
set number         

" Show cursor position.
set ruler         

" Turn of .swp files and select a tmp dir for them
set noswapfile                   
set directory=$HOME/.vim/tmp//,.

" Turn text wrap off
set wrap!

" Highlight matches.
set hlsearch      

" Set the terminal's title
set title               

" No beeping.
set visualbell                   

" Don't make a backup before overwriting a file.
set nobackup       
set nowritebackup 

" Global tab width.
set tabstop=2     
set shiftwidth=2 
set expandtab   

" Set UTF8 encoding
set encoding=utf8

" Set visible cursor line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
hi CursorLine ctermbg=240
hi Normal ctermbg=none

" Abbreviations
ab cl, console.log('=========>',)<ESC>i

" Enable system clipboard
if $TMUX == ''
  "set clipboard=unnamed
  set clipboard+=unnamed
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Bundle 'VundleVim/Vundle.vim'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-cucumber'
Bundle 'scrooloose/nerdcommenter'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'godlygeek/tabular'
Bundle 'airblade/vim-gitgutter'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'ryanoasis/vim-devicons'
Bundle 'tiagofumo/vim-nerdtree-syntax-highlight'

Bundle 'tpope/vim-fugitive'
" Show the status line all the time
set laststatus=2 
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

Bundle 'Valloric/YouCompleteMe'
set completeopt-=preview

Bundle 'kien/rainbow_parentheses.vim'
" Toggle RainbowParenthese highlighting
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadBraces
let g:rainbow#blacklist = [233, 234, 236]

Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" set autochdir
lcd %:p:h
autocmd BufEnter * let b:syntastic_javascript_eslint_exec = system('echo -n $(npm bin)/eslint')
let g:syntastic_error_symbol = '🔴'
highlight link SyntasticErrorSign SignColumn
let g:syntastic_warning_symbol = '🔵'
highlight link SyntasticWarningSign SignColumn

Bundle 'scrooloose/nerdtree'
map ,p :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>
let NERDTreeIgnore=['node_modules']

Bundle 'kien/ctrlp.vim'
map ,b :CtrlPBuffer<CR>
" CtrtlP Plugin mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" Exclude the following:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
" Custom ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1

call vundle#end()
