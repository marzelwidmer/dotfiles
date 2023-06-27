" ===============
" === Plugins ===
" ===============

call plug#begin(stdpath('data') . '/plugged')

Plug 'goolord/alpha-nvim' " startup screen
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'udalov/kotlin-vim'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'williamboman/mason.nvim' " package manager for external language tools (LSP servers etc)
Plug 'williamboman/mason-lspconfig.nvim' " bridges mason to lspconfig
Plug 'neovim/nvim-lspconfig'
Plug 'elixir-editors/vim-elixir'
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-buffer' " Buffer contents source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-path' " filesystem path source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'onsails/lspkind-nvim'
Plug 'L3MON4D3/LuaSnip' " Snippets plugin
Plug 'jiangmiao/auto-pairs' " auto close pairs (),{},[], etc
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag' " auto-close HTML tags
Plug 'xiyaowong/nvim-cursorword' " highlight word under cursor
Plug 'nvim-lua/plenary.nvim'
Plug 'terrortylor/nvim-comment' " toggle comments
Plug 'mattn/emmet-vim' " HTML auto-expander
Plug 'norcalli/nvim-colorizer.lua' " colorize colors in CSS etc.
Plug 'christoomey/vim-tmux-navigator'

" Themes (with treesitter support)
Plug 'rafamadriz/neon'
Plug 'andersevenrud/nordic.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'luisiacc/gruvbox-baby'
Plug 'Mofiqul/vscode.nvim'

call plug#end()


" ==============================
" === General configuration ====
" ==============================

let mapleader = "\<Space>"
set number
set mouse=a
set cursorline
set ignorecase
set hidden
set cmdheight=2
set splitbelow
set splitright
set shiftwidth=2
set tabstop=2
set copyindent
set updatetime=500
set scrolloff=5
set expandtab


if (has("termguicolors"))
  set termguicolors
endif

colorscheme gruvbox-baby


" ========================
" Plugin configuration ===
" ========================

" ==========================
" === Keyboard shortcuts ===
" ==========================

" reload configuration file with '<Space>sv'
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>n :NvimTreeToggle<CR>
" nmap <C-p> :FZF<CR>
nnoremap <leader>o :GitFiles<CR>
nnoremap <leader>O :Files<CR>
nnoremap <leader>b :Buffers<CR>

" next and previous buffers
nnoremap <leader>H :bp<CR>
nnoremap <leader>L :bn<CR>

nnoremap <leader>l :vsplit<CR>
nnoremap <leader>j :split<CR>

nnoremap <leader>f :Rg<CR>

nnoremap <leader>c :CommentToggle<CR>
vnoremap <leader>c :CommentToggle<CR>

" highlight yanked lines
au TextYankPost * silent! lua vim.highlight.on_yank()

" Emmet
" Only enable for HTML and CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" Change the trigger for Emmet to ,,
let g:user_emmet_leader_key=','

lua << EOF
require('lualine').setup {
  options = { theme = 'gruvbox-baby' },
}

require("bufferline").setup {
  options = {
    numbers = function(opts)
      return string.format('%s', opts.id)
    end,
    diagnostics = 'nvim_lsp'
  }
}

require('nvim-ts-autotag').setup()

require('nvim-tree').setup()

require('gitsigns').setup()

require('nvim_comment').setup()

require('colorizer').setup()

require('alpha').setup(require'alpha.themes.startify'.config)

-- mason
require("mason").setup()
require("mason-lspconfig").setup()

-- treesitter
require('nvim-treesitter.configs').setup {
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = {
    enable = true,
    },
  indent = {
    enable = true,
    }
  }

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gE', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gu', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end


-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'rust_analyzer', 'elixirls', 'tsserver', 'gopls', 'kotlin_language_server', 'pylsp', 'lemminx' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.elixirls.setup {
  cmd = { vim.fn.expand('~/src/third_party/elixir-ls/release/language_server.sh') }
}

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        path = "[Path]"
      })
    }),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 5 },
    { name = 'path' },
  },
}

EOF
