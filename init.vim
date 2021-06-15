"Vim plug instalation --> https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'voldikss/vim-floaterm'
call plug#end()

"vimwiki
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_list=[{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

"" Fix backspace indent
set backspace=indent,eol,start
"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set hls
set autoindent
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set wrap
set guicursor=
"set undodir=~/.vim/undodir
"set undofile

let mapleader=','

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" git-gutter
set updatetime=100

"General programming rules
autocmd Filetype c,cpp,python,javascript,typescript color codedark
autocmd Filetype c,cpp,python,javascript,typescript syntax on
autocmd Filetype c,cpp,python,javascript,typescript set rnu
autocmd BufRead,BufNewFile,BufAdd,BufCreate,BufEnter * :AirlineRefresh
"programming symbols autocompletion
"autocmd Filetype c,cpp,python,javascript,typescript inoremap ( ()<ESC>i
"autocmd Filetype c,cpp,python,javascript,typescript inoremap { {}<ESC>i
"autocmd Filetype c,cpp,python,javascript,typescript inoremap [ []<ESC>i

"Cpp config
autocmd Filetype cpp inoremap this  this->

"buffer movmement
nnoremap <F3>   :bnext<CR>
nnoremap <F2>   :bprev<CR>
"window movement
nnoremap <SPACE> <C-w>w
nnoremap <backspace> <C-w>c
nnoremap <TAB> <C-w>v<C-w>w
nnoremap <TAB>v <C-w>v<C-w>w
nnoremap <TAB>s <C-w>s<C-w>w
"full screen
nnoremap <TAB>o <C-w>o
"back to latest buffer
nnoremap <TAB>p :b#<CR>

"" Make command
noremap <leader>mm :make<CR>
noremap <leader>mc :make clean<CR>

"Press scape to disable syntax hl search
nmap <ESC> <ESC>:nohl<CR>

"Ctags
noremap <leader>ct  :!ctags -R .<CR>

"list vim buffers
noremap <leader>l   :ls<CR>

"open terminal
noremap <leader>t   :terminal<CR>i
noremap -   :terminal<CR>i
"exit terminal mode
tnoremap <Esc> <C-\><C-n>
"Set bufhidden to keeps the buffer open
autocmd TermOpen * set bufhidden=hide

"Floaterm
noremap ``   :FloatermToggle<CR>

"FZF
nnoremap <leader>f :FZF<CR>

"reload vimrc
nnoremap %% :source ~/.config/nvim/init.vim<CR>

"opens help in full screen
nnoremap K K<C-w>o
