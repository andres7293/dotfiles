"Vim plug instalation --> https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
"Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/plenary.nvim' "harpoon dependency
Plug 'nvim-lualine/lualine.nvim'
"Test this plugin
"Plug 'ap/vim-buftabline'
Plug 'preservim/nerdtree'
Plug 'terrortylor/nvim-comment'
call plug#end()

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
noremap <Leader>gc :Git<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" git-gutter
set updatetime=100

"General programming rules
autocmd Filetype c,cpp,python,javascript,typescript,go color codedark
autocmd Filetype c,cpp,python,javascript,typescript,go syntax on
autocmd Filetype c,cpp,python,javascript,typescript,go set rnu
autocmd BufEnter * set nu

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

"reload vimrc
nnoremap %% :source ~/.config/nvim/init.vim<CR>

"Coc code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

"" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>

"Harpoon
"Mark file
nnoremap <leader>ma :lua require("harpoon.mark").add_file()<cr>
"Quick menu
nnoremap <leader>ml :lua require("harpoon.ui").toggle_quick_menu()<cr>
"Cycle list
nnoremap <leader>mn :lua require("harpoon.ui").nav_next()<cr>
nnoremap <leader>mp :lua require("harpoon.ui").nav_prev()<cr>

"nvim comment
"vnoremap c :'<,'>CommentToggle<cr>

lua << END
require('lualine').setup()
require('nvim_comment').setup()
END
