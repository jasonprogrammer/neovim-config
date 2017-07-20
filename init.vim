call plug#begin()

" General default setting improvements for VIM
Plug 'tpope/vim-sensible'

" Fancy status bar
Plug 'vim-airline/vim-airline'

" Fuzzy searching for file names, and within files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Use ripgrep to find string in project files, and put results in the quickfix window
Plug 'jremmen/vim-ripgrep'

" Use this to replace across files by editing in the quickfix window after a ripgrep search
Plug 'stefandtw/quickfix-reflector.vim'

" Helps toggle code comments in various languages
Plug 'tomtom/tcomment_vim'

" Auto-completion for Neovim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Python auto-complete support
Plug 'zchee/deoplete-jedi'

" Helps cycle through history of text previously copied
Plug 'vim-scripts/YankRing.vim'

" Asynchronous linting for different languages
Plug 'w0rp/ale'

" Quickly navigate to any word on the screen (use 's' in normal mode, followed by the first letter
" of the word, to search forward, and 'S' to search backwards)
Plug 'justinmk/vim-sneak'

" Open a shell at the location of the current file by typing: got
Plug 'justinmk/vim-gtfo'

" Sets the project root so search utilities search the project for string matches
Plug 'airblade/vim-rooter'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'idanarye/vim-merginal'

" Highlights trailing whitespace. Fix it with :FixWhitespace
Plug 'bronson/vim-trailing-whitespace'

" De-clutters file navigation with netrw, and adds features to it
Plug 'tpope/vim-vinegar'

" Python support for VIM
Plug 'davidhalter/jedi-vim'

" Cross-file bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" Dark theme that also works well in the terminal (for me at least)
Plug 'tomasr/molokai'

" Auto reloads files when they change, even when Neovim is run in the terminal
Plug 'djoshea/vim-autoread'

" Auto-format files
Plug 'Chiel92/vim-autoformat'

Plug 'tpope/vim-eunuch'
Plug 'justinmk/vim-dirvish'
call plug#end()

" Allow switching buffers without saving them
set hidden

" Tabs as 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Buffer search settings
set inccommand=split
set incsearch

" Enable syntax highlighting
syntax enable

" clear search highlighting with <enter> key
nnoremap <CR> :noh<CR><CR>

" Make searches case insensitive by default
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


" store history of FZF searches (ctrl-p to search back)
let g:fzf_history_dir = '~/.fzf/fzf-history'

" Copy file path to clipboard: https://stackoverflow.com/a/954336
:nmap cp :let @+ = expand("%:p")



" -- Language-specific config --

" Python support via Jedi
let g:jedi#force_py_version = 3
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_definitions_command = "<leader>pg"

" Python code formatting: https://github.com/Chiel92/vim-autoformat
let g:formatter_yapf_style = 'pep8'
