set exrc
set guicursor=
set relativenumber
set number
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set showcmd
set noshowmode
set shortmess+=c
set autoread
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set textwidth=0
set signcolumn=yes
set cmdheight=2
set updatetime=50

call plug#begin('~/.vim/plugged')
Plug 'folke/which-key.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

set cursorline
set background=dark
augroup user_colors
    autocmd!
    autocmd ColorScheme * hi Normal guibg=none ctermbg=none
    autocmd ColorScheme * hi LineNr guibg=none ctermbg=none
    autocmd ColorScheme * hi Folded guibg=none ctermbg=none
    autocmd ColorScheme * hi NonText guibg=none ctermbg=none
    autocmd ColorScheme * hi SpecialKey guibg=none ctermbg=none
    autocmd ColorScheme * hi VertSplit guibg=none ctermbg=none
    autocmd ColorScheme * hi SignColumn guibg=none ctermbg=none
    autocmd ColorScheme * hi EndOfBuffer guibg=none ctermbg=none
    autocmd ColorScheme * hi Pmenu ctermbg=187
augroup END
colorscheme seoul256

" Lightline
let g:lightline = {
    \   'colorscheme': 'seoul256',
    \   'component': {
    \   'filename': '%n:%f',
    \   },
    \   'active': {
    \    'left': [ [ 'mode', 'paste'],
    \              [ 'gitbranch', 'readonly', 'filename', 'modified']
    \            ]
    \   },
    \   'component_function': {
    \    'gitbranch': 'FugitiveHead'
    \   },
    \ }

" Prevent new commented line when o but yes with return.
au FileType * set fo-=o

" Coq
let g:coq_settings = { 'auto_start': v:true }

let mapleader = " "

" Telescope: find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ups <cmd>Telescope grep_string<cr>
nnoremap <leader>lps <cmd>Telescope live_grep<cr>
" Telescope: project search by string
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<cr>

" UndoTree
nnoremap <leader>ud :UndotreeToggle<cr>

lua require('config.lsp.init').setup()
