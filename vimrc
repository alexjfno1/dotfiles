set nocompatible
filetype off

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins via vim-plug
call plug#begin()

" ====== Plugin Manager =======================================================
Plug 'junegunn/vim-plug'
" =============================================================================


" ====== File Navigation ======================================================
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rking/ag.vim'

Plug 'scrooloose/nerdtree'
  map ,p :NERDTreeToggle<CR>
  nmap ,n :NERDTreeFind<CR>
  let NERDTreeIgnore=['node_modules']

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Enable file hightlighting
  let g:NERDTreeFileExtensionHighlightFullName = 1
  let g:NERDTreeExactMatchHighlightFullName = 1
  let g:NERDTreePatternMatchHighlightFullName = 1

  " Colours for files
  let s:green = "8FAA54"
  let s:lightPurple = "834F79"
  let s:blue = "689FB6"
  let s:red = "AE403F"

  " Set colour for each filetype
  let g:NERDTreeExtensionHighlightColor = {}
  let g:NERDTreeExtensionHighlightColor['css'] = s:red
  let g:NERDTreeExtensionHighlightColor['js'] = s:blue
  let g:NERDTreeExtensionHighlightColor['html'] = s:lightPurple
  let g:NERDTreeExtensionHighlightColor['json'] = s:green

Plug 'kien/ctrlp.vim'
  " CtrtlP Plugin mappings
  map ,b :CtrlPBuffer<CR>
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'
  
  " Exclude the following:
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" =============================================================================

" ====== Git ==================================================================
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'
  " Show the status line all the time
  set laststatus=2
  
  " Useful status information at bottom of screen
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
" =============================================================================

" ====== Syntax Highlighting, Formatting & Linting ==================================================
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'styled-components/vim-styled-components'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  " CoC extensions
  let g:coc_global_extensions = ['coc-tsserver', 'coc-json']
  nmap <silent> gd <Plug>(coc-definition)
  "
  " Fix syntax highlight for Coc plugin floating errors
  hi CocErrorFloat guifg=Magenta guibg=Magenta

Plug 'neoclide/coc-prettier'
  " Add CoC Prettier if prettier is installed
  if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
    let g:coc_global_extensions += ['coc-prettier']
  endif

Plug 'neoclide/coc-eslint'
  " Add CoC ESLint if ESLint is installed
  if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
    let g:coc_global_extensions += ['coc-eslint']
  endif

" Turn on syntax highlighting and force vim to rescan the entire buffer when highlighting
syntax enable
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear  
" =============================================================================

" ====== Window Management ====================================================
Plug 'bling/vim-airline'
  let g:airline_powerline_fonts = 1

Plug 'christoomey/vim-tmux-navigator'

nmap <Tab> :b#<CR>        " Tab to last buffer to make it easy to go to the last file you were in.
map Q :qa<CR>             " Exit Vim quickly

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Create window splits easier. vv = vsplit, ss = hsplit
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s
" =============================================================================

" ====== Look & Feel ==========================================================
set background=dark               " Colour scheme
set ruler                         " Show cursor position.
set wrap!                         " Turn text wrap off
set hlsearch                      " Highlight matches.
set title                         " Set the terminal's title
set novisualbell                  " No beeping.
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set encoding=utf8                 " Set UTF8 encoding
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set number                        " Show line numbers.

" Global tab width.
set tabstop=2     
set shiftwidth=2 
set expandtab   

" Set invisible cursor line
set cursorline!
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
hi CursorLine ctermbg=240
hi Normal ctermbg=none
" =============================================================================

" ====== General ==============================================================
filetype plugin indent on         " Turn on file type detection.
let mapleader = ","               " Map leader key
set autoread                      " Turn on autoread to watch for changes
:au CursorHold * checktime        " Fires after you move the cursor and then let it sit still for updatetime

" Turn of .swp files and select a tmp dir for them
set noswapfile                   
set directory=$HOME/.vim/tmp//,.

" Don't make a backup before overwriting a file.
set nobackup       
set nowritebackup 

" Enable system clipboard
if $TMUX == ''
  set clipboard+=unnamed
endif
" =============================================================================

" ====== Abbreviations ========================================================
ab cl, console.log('=========>',)<ESC>i
" =============================================================================

call plug#end()
