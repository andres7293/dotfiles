"Vim plug instalation --> https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/plenary.nvim' "harpoon dependency
Plug 'nvim-lualine/lualine.nvim'
Plug 'terrortylor/nvim-comment'
"Colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
""ZERO-LSP
"" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
"  Snippets
Plug 'L3MON4D3/LuaSnip'
" Snippet collection (Optional)
Plug 'rafamadriz/friendly-snippets'
Plug 'VonHeikemen/lsp-zero.nvim'
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
set textwidth=120

let mapleader=','

"" Git fugitive
"noremap <Leader>ga :Gwrite<CR>
"noremap <Leader>gc :Git<CR>
noremap <Leader>gpu :Git push<CR>
noremap <Leader>gpl :Git pull<CR>
noremap <Leader>gl :Git log<CR>
noremap <Leader>gs :Git status<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gds :Git diff --staged<CR>
noremap <Leader>gdd :Git diff<CR>
noremap <Leader>gc :Git commit<CR>
noremap <Leader>gf :Git fetch<CR>

" git-gutter
set updatetime=100

"Colorscheme
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_signs=0
let g:gitgutter_override_sign_column_highlight=1
set background=dark
colorscheme gruvbox

"General programming rules
"autocmd Filetype c,cpp,python,javascript,typescript,go color gruvbox
autocmd Filetype c,cpp,python,javascript,typescript,go syntax on
autocmd Filetype c,cpp,python,javascript,typescript,go set rnu
autocmd BufEnter c,cpp,python,javascript,typescript,go set nu
autocmd Filetype markdown set textwidth=80
autocmd Filetype markdown set nu

"buffer movmement
nnoremap <F3>   :bnext<CR>
nnoremap <F2>   :bprev<CR>
"window movement
nnoremap <SPACE> <C-w>w
nnoremap <backspace> <C-w>c
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

"list vim buffers
noremap <leader>l   :ls<CR>

"open terminal
noremap <leader>t   :terminal<CR>i
"exit terminal mode
tnoremap <Esc> <C-\><C-n>
"Set bufhidden to keeps the buffer open
autocmd TermOpen * set bufhidden=hide

"reload vimrc
nnoremap %% :source ~/.config/nvim/init.vim<CR>

"Telescope
"" Find files using Telescope command-line sugar.
nnoremap tff <cmd>Telescope find_files<cr>
nnoremap tfg <cmd>Telescope live_grep<cr>
nnoremap tbf <cmd>Telescope buffers<cr>
nnoremap tfh <cmd>Telescope help_tags<cr>
nnoremap tfo <cmd>Telescope oldfiles<cr>
"Telescope git
nnoremap tgb <cmd>Telescope git_branches<cr>
"Telescope treesitter search variables,functions,etc
nnoremap tts <cmd>Telescope treesitter<cr>

"Harpoon
"Mark file
nnoremap <leader>ma :lua require("harpoon.mark").add_file()<cr>
"Quick menu
nnoremap <leader>ml :lua require("harpoon.ui").toggle_quick_menu()<cr>
"Cycle list
nnoremap <leader>mn :lua require("harpoon.ui").nav_next()<cr>
nnoremap <leader>mp :lua require("harpoon.ui").nav_prev()<cr>

"Adjust screen after search for word
nnoremap n  nzz<CR>

"Delete unwanted space at the end of line
nnoremap <leader>w :%s/\s\+$//e<CR>

"nvim comment
"vnoremap c :'<,'>CommentToggle<cr>

lua << END
require('lualine').setup()
require('nvim_comment').setup()
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

require'nvim-treesitter.configs'.setup {
  --auto install the following parsers:
  ensure_installed = { "c", "cpp", "javascript", "typescript", "go", "python" },
  auto_install = true,
  highlight = {
    enable = true,
  },
}

END
