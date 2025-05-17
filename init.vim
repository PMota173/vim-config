" ------------------------------
" Configurações básicas
" ------------------------------
set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set timeoutlen=1000 
set termguicolors

" ------------------------------
" Plugins com vim-plug
" ------------------------------
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'arzg/vim-colors-xcode'
Plug 'tpope/vim-fugitive'

Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/vim-vsnip'            " Adicionado para snippets
Plug 'hrsh7th/vim-vsnip-integ'      " Integração opcional

Plug 'windwp/nvim-autopairs'
Plug 'github/copilot.vim'
Plug 'preservim/nerdtree'
call plug#end()

" ------------------------------
" Aparência
" ------------------------------
colorscheme xcode

" ------------------------------
" Variáveis globais
" ------------------------------
let mapleader = " "

let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

let g:tagalong_verbose = 1

let g:ale_fixers = {
 \ 'html': ['prettier'],
 \ 'css': ['stylelint'],
 \}
let g:ale_linters = {
 \ 'html': ['htmlhint'],
 \ 'css': ['stylelint'],
 \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:NERDTreeQuitOnOpen = 1

" ------------------------------
" Atalhos
" ------------------------------
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :source $MYVIMRC \| echo "Config reloaded!"<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-j> :cnext<CR> 
nnoremap <C-k> :cprev<CR> 
vnoremap <leader>p "_dP" 
vnoremap <leader>y "+y" 
nnoremap <leader>y "+y" 
nnoremap <leader>Y gg"+yG
nnoremap <leader>r :w<CR>:!python3 %
nnoremap <leader>vp :NERDTreeToggle<CR>

vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
inoremap jj <Esc>

" ------------------------------
" Autopairs
" ------------------------------
lua << EOF
require("nvim-autopairs").setup {}
EOF

" ------------------------------
" Configuração do LSP
" ------------------------------
lua << EOF
local nvim_lsp = require('lspconfig')

-- Reutilizável: on_attach para atalhos de LSP
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }
  local buf = vim.api.nvim_buf_set_keymap
  local opt = vim.api.nvim_buf_set_option

  buf(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf(bufnr, 'n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  opt(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- LSPs
nvim_lsp.ts_ls.setup{ on_attach = on_attach }
nvim_lsp.html.setup{ on_attach = on_attach }
nvim_lsp.cssls.setup{ on_attach = on_attach }
nvim_lsp.pyright.setup{ on_attach = on_attach }
nvim_lsp.jsonls.setup{ on_attach = on_attach }
EOF

" ------------------------------
" Configuração do autocompletar (nvim-cmp)
" ------------------------------
lua << EOF
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = {
    { name = 'nvim_lsp' },
  }
})
EOF


