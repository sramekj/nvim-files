
let $HOME = 'c:/Users/sramek'

syntax on

set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4  
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/vimfiles/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set cmdheight=2
set updatetime=200
set guicursor=
" set shortmess+=c
set signcolumn=yes
set pyxversion=3


call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-utils/vim-man'
Plug 'kyazdani42/nvim-web-devicons' 
Plug 'kyazdani42/nvim-tree.lua'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-prettier', { 'do': 'yarn install --frozen-lockfile' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_invert_selection = 0

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "

let g:ntrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

let g:OmniSharp_server_use_net6 = 1

let g:coc_sources_disable_map = { 'cs': ['cs', 'cs-1', 'cs-2', 'cs-3'] }

let g:coc_global_extensions=[ 'coc-omnisharp', 'coc-clangd', 'coc-cmake', 'coc-css', 'coc-cssmodules', 'coc-eslint', 'coc-git', 'coc-html', 'coc-json', 'coc-sh', 'coc-stylelint', 'coc-sql', 'coc-xml', 'coc-yaml', 'coc-vimlsp', 'coc-tsserver', 'coc-ltex', 'coc-markdownlint', 'coc-swagger', 'coc-tailwindcss', 'coc-toml', 'coc-snippets' ]

function Disable_ls_duplicates()
:call CocAction('toggleSource', 'cs')
:call CocAction('toggleSource', 'cs-1')
:call CocAction('toggleSource', 'cs-2')
:call CocAction('toggleSource', 'cs-3')
endfunction

nnoremap dld :call Disable_ls_duplicates()



inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd FileType json syntax match Comment +\/\/.\+$+

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <C-Up> :resize -2<CR>
nnoremap <silent> <C-Down> :resize +2<CR>
nnoremap <silent> <C-Left> :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>



" Navigate buffers

nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>

" undo tree

nnoremap <leader>u :UndotreeToggle<CR>

" ripgrep

nnoremap <leader>r :Rg<CR>

" quick replace

nnoremap S :%s//g<Left><Left>


nnoremap <silent> <leader> :noh<CR>

" === telescope ======================================

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <A-f> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fr <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" === COC =============================================

inoremap <silent><expr> <S-space> coc#refresh()
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)
nmap <silent> <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <leader>cr :CocRestart
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>cl  <Plug>(coc-codelens-action)

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

autocmd CursorHold * silent call CocActionAsync('highlight')

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" === fugitive ========================================

nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>

" === nvim-tree =======================================

nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <A-e> :NvimTreeToggle<CR>
nnoremap <leader>er :NvimTreeRefresh<CR>
nnoremap <leader>ef :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=blue

lua <<EOF
require('user.nvim-web-devicons')
require('user.nvim-tree')
EOF
