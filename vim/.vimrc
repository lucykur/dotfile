set rtp+=~/.vim/vundle/
call vundle#rc()
filetype off

Bundle 'tpope/vim-git'
Bundle 'csv.vim'
Bundle 'vim-scripts/Rainbow-Parenthsis-Bundle'
Bundle 'sudo.vim'
Bundle 'austintaylor/vim-indentobject'
Bundle 'visualstar.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-fugitive'
:set lazyredraw
highlight diffAdded guifg=#00bf00
highlight diffRemoved guifg=#bf0000
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-surround'
Bundle 'FuzzyFinder'
Bundle 'matchit.zip'
runtime macros/matchit.vim
Bundle 'errormarker.vim'
Bundle 'abolish.vim'
Bundle 'delimitMate.vim'
Bundle 'camelcasemotion'
Bundle 'scrooloose/syntastic'
autocmd FileType haskell compiler hlint

let g:rubytest_in_quickfix = 1 

set nocompatible

set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch

map Q gq


if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

set nowrap

if has("autocmd")
  filetype plugin indent on

  autocmd BufNewFile,BufRead *.txt setfiletype text

  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  augroup vimrcEx
  au!


  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd BufWritePost .vimrc source $MYVIMRC

  augroup END

else

  set autoindent

endif

set expandtab

set laststatus=2

let mapleader = ","

map <Leader>R :e doc/README_FOR_APP<CR>
map <Leader>a :Ack 

map <Leader>gb :Gblame C<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
nmap <leader>gL :Gitv<cr>
nmap <leader>gl :Gitv!<cr>
vmap <leader>gl :Gitv!<cr>


map <Leader>fb :FufBuffer<CR>
map <Leader>ff :FufCoverageFile<CR>
map <Leader>ft :FufTag<CR>
map <Leader>fc :FufChangeList<CR>
map <Leader>fj :FufJumpList<CR>
map <Leader>fm :FufBufferTag<CR>
map <Leader>fk :FufBookmarkFile<CR>
map <Leader>fa :FufBookmarkFileAdd<CR>
map <Leader>fq :FufQuickFix<CR>
map <Leader>fx :!ctags -R *<CR>

map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
map <leader>n :NERDTreeToggle<CR>


map <leader>ob :OpenBookmark
map <leader>b :Bookmark
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>


vmap D y'>p

vmap P p :call setreg('"', getreg('0')) <CR>

au! BufRead,BufNewFile *.haml         setfiletype haml

nmap <F1> <Esc>

imap <C-F> <C-R>=expand("%")<CR>

imap <C-L> <Space>=><Space>


command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb

if filereadable(".vimrc.local")
  source .vimrc.local
endif

set number
set numberwidth=5

let g:snippetsEmu_key = "<S-Tab>"

set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

set ignorecase
set smartcase

set tags=./tags;

let g:fuf_splitPathMatching=1

command -bar -nargs=1 OpenURL :!open <args>
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction
map <Leader>w :call OpenURL()<CR>

set hidden
set guioptions-=m
set guioptions-=T

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=blue guibg=blue
function! Getcwd_easy()
   let curdir = substitute(getcwd(), '^/home/.*/', "~/", "g")
   return curdir
endfunction
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}[%{Getcwd_easy()}]%=%-14.(%l,%c%V%)\ %P
set shortmess=atI
let g:miniBufExplMapCTabSwitchBufs = 1

set ofu=syntaxcomplete#Complete
set completeopt+=longest,menuone
:highlight Pmenu guibg=brown gui=bold

:filetype plugin on
:nmap <c-tab> :bnext<cr>
:nmap <c-s-tab> :bprevious<cr>



autocmd BufReadPost fugitive://* set bufhidden=delete

set autowriteall

let g:fuf_patternSeparator = ';'
let g:Gitv_WipeAllOnClose = 1
highlight diffAdded guifg=#00ff00
highlight diffRemoved guifg=#ff0000

set t_Co=256
set background=light

set smartindent 
set shiftwidth=4 
set tabstop=4 
set expandtab
set guioptions+=c
au FocusLost * :wa
set autowriteall


au FileType javascript setl sw=4 sts=4 et
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

