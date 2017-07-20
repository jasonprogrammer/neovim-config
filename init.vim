call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tomtom/tcomment_vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-scripts/YankRing.vim'
Plug 'w0rp/ale'
Plug 'justinmk/vim-sneak'
Plug 'ton/vim-bufsurf'
Plug 'justinmk/vim-gtfo'
Plug 'airblade/vim-rooter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-vinegar'
Plug 'davidhalter/jedi-vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'idanarye/vim-merginal'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'Chiel92/vim-autoformat'
Plug 'djoshea/vim-autoread'
Plug 'tpope/vim-eunuch'
Plug 'justinmk/vim-dirvish'
call plug#end()

" Allow switching buffers without saving them
set hidden

set tabstop=4
set shiftwidth=4
set expandtab
set inccommand=split
set incsearch

" Python support via Jedi
let g:jedi#force_py_version = 3
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_definitions_command = "<leader>pg"

" clear search highlighting with <enter> key
nnoremap <CR> :noh<CR><CR>

" auto-reload files that get changed
set autoread

" make searches case insensitive by default
set ignorecase
set smartcase

:inoremap fd <Esc>
set showcmd
:let mapleader = " "
:nnoremap <leader>pf :GFiles<CR>
:nnoremap <leader>/ :Ag<CR>
:nnoremap <leader>bb :History<CR>
:nnoremap <leader>ff :Vexplore<CR>
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
:nnoremap <leader>sl :colder<cr> :wincmd j<cr>
:nnoremap <leader>wc :q<cr>
:nnoremap <leader>wm :wincmd o<cr>
:nnoremap <leader>fs :w<CR>
:nnoremap <leader>* :Rg<CR>
:nnoremap <tab> <C-^>

" Terminal mouse support
:set mouse=a

" Theme
syntax enable
set background=dark
colorscheme molokai

" Enable autocompletion
let g:deoplete#enable_at_startup = 1

" Clipboard support
set clipboard+=unnamedplus

" Switch between windows
:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-l> :wincmd l<CR>

" Ale Linting
let g:ale_set_quickfix = 1
" Go to prev/next lint error
nmap <silent> <C-[> <Plug>(ale_previous_wrap)
nmap <silent> <C-]> <Plug>(ale_next_wrap)

" Sneak motion like EasyMotion
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>g- :Silent Git stash<CR>:e<CR>
nnoremap <Leader>g+ :Silent Git stash pop<CR>:e<CR>

" Vim Rooter
let g:rooter_patterns = ['.rooter-project']

" UltiSnips config
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Use ripgrep instead of Ag for fzf
command! -bang -nargs=* RgAg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" https://github.com/Chiel92/vim-autoformat
let g:formatter_yapf_style = 'pep8'

" store history of FZF searches (ctrl-p to search back)
let g:fzf_history_dir = '~/.fzf/fzf-history'

" Copy file path to clipboard
" https://stackoverflow.com/a/954336
:nmap cp :let @+ = expand("%:p")

