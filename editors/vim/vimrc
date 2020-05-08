" vim: set foldmethod=marker foldlevel=0 nomodeline colorcolumn=80:
" *****************************************************************************
" {{{ Defaults settings
" *****************************************************************************
" check ':help default'
unlet! g:skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim
" Check if on Mac
let s:darwin = has('mac')
" use conda enviroment installed neovim. inspired by
" https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
if has('nvim')
  " TODO: check if `BASE_CONDA` is not empty
  " add here a check if enviroment variable is define and prompt if not
  let b:conda_path = $BASE_CONDA
  " using conda to install dependencies specified in different python
  " enviroments
  " let g:python_host_prog = b:conda_path.'/envs/neovim2/bin/python'
  " let g:python3_host_prog = b:conda_path.'/envs/neovim3/bin/python'
  let g:python3_host_prog = "/Users/anton/miniconda3/bin/python"
  unlet b:conda_path
endif
" }}}
" *****************************************************************************
" {{{ Plugins - Installation
" *****************************************************************************
call plug#begin('~/.vim/plugged')
"
" Statusbar -------------------------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
" Colorthemes -----------------------------------------------------------------
Plug 'dracula/vim'
"
" Alignmnet/Looks -------------------------------------------------------------
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
"
" Git/GitHub ------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-github-dashboard'
"
" Browsing --------------------------------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"
" Coding support --------------------------------------------------------------
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
"
" Project based support -------------------------------------------------------
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'tpope/vim-dispatch'
"
" Auto-completion -------------------------------------------------------------
" Completion Framework for Neovim & Vim8+ but will only be used with Neovim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Language support ------------------------------------------------------------
" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
"
" Python
Plug 'zchee/deoplete-jedi'
Plug 'vim-python/python-syntax'
" better Python highlighter which is syntax aware - good, but requires tweaks
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
"
" Vim
" Helper plugins --------------------------------------------------------------
Plug 'wincent/terminus'
Plug 'janko-m/vim-test'
" local plugins ---------------------------------------------------------------
Plug '~/Documents/Projects/vim-osiris'
"
call plug#end()
" }}}
" *****************************************************************************
" {{{ Basic Settings
" *****************************************************************************
let g:mapleader=','                         " use ',' as leader
if !has('nvim')
  set nocompatible                          " make vim more vim like
endif
set autoread                                " reload changed buffer
au FocusGained,BufEnter   * :checktime      " update at change of focus
" }}}
" *****************************************************************************
" {{{ Spaces and Tabs
" *****************************************************************************
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for indent
set expandtab       " tabs are spaces
set autoindent      " automatically ident
" }}}
" *****************************************************************************
" {{{ UI config
" *****************************************************************************
syntax on                   " use syntax highlighting
color dracula               " best Colorscheme ever
set number                  " show line numbers
set cursorline              " highlight current line
set wildmenu                " visual autocomplete for command menu
set showmatch               " highlight matching [{()}]
filetype indent plugin on   " automatic lang-dependent ident
set mouse=a                 " allow mouse usage
set clipboard+=unnamedplus  " using system clipboard on mac
" gui colors if running iTerm
if $TERM_PROGRAM =~? 'iTerm'
  set termguicolors
endif
" colors for Ale matching dracula theme
hi ALEErrorSign   guifg=#ff5555 guibg=#282a36
hi ALEWarningSign guifg=#f1fa8c guibg=#282a36
" color settings for working with dracula theme
hi Pmenu    guifg=#f8f8f2 guibg=#646e96
hi PmenuSel guifg=#282a36 guibg=#50fa7b
" Add spelling to completion
set complete+=kspell
" Spelling highlight (currently not correctly working for undercurl)
hi SpellBad gui=underline guifg=#ff5555
hi SpellCap gui=underline guifg=#ffb86c
" }}}
" *****************************************************************************
" {{{ Searching
" *****************************************************************************
set ignorecase      " case of normal letter is ignored
set smartcase       " ignore case when lowercase letters only
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
" }}}
" *****************************************************************************
" {{{ QuickFixes
" *****************************************************************************
" forces neovim to use english as default language
if has('nvim')
  language en_US
endif
" }}}
" *****************************************************************************
" {{{ Plugin - Configuration
" *****************************************************************************
" makes plugins get triggered faster - like gitgutter
set updatetime=100
" NERDTree --------------------------------------------------------------------
" toggle NERDTree
nnoremap <C-N> :NERDTreeToggle<CR>
" Makes NERDTree look better
let g:NERDTreeMinimalUI = 1
" fold/unfold dirs & double click
let g:NERDTreeMouseMode = 2
" highlight selected entry in tree
let g:NERDTreeHighlightCursorline = 1
" ignore following extenstions
let g:NERDTreeIgnore = [
      \ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
      \ '\.o$', '\.so$', '\.egg$', '^\.git$',
      \ '__pycache__', '\.DS_Store'
      \ ]
" close vim if only NERDTree is opened
autocmd bufenter *
      \   if (winnr("$") == 1 &&
      \       exists("b:NERDTree") &&
      \       b:NERDTree.isTabTree()
      \   ) | q | endif
" git support for Nerdtree
let g:NERDTreeIndicatorMapCustom = {
      \   'Modified'  : '✶',
      \   'Staged'    : '⊻',
      \   'Untracked' : '✭',
      \   'Renamed'   : '→',
      \   'Unmerged'  : '═',
      \   'Deleted'   : '✕',
      \   'Dirty'     : '✗',
      \   'Clean'     : '✔︎',
      \   'Ignored'   : '‼︎',
      \   'Unknown'   : '?'
      \   }
" identline -------------------------------------------------------------------
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#424450'
" Airline ---------------------------------------------------------------------
let g:airline_theme='dracula'     " nice Airline theme
let g:airline_powerline_fonts = 1   " use better-looking Powerline symbols
" insures usage of powerline but does not use symbols for seperator
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#fnamemod = ':t'
" deoplete completion ---------------------------------------------------------
" start deoplete from beginning
let g:deoplete#enable_at_startup = 1
" use smart case for completion
call deoplete#custom#option('smart_case', v:true)
" use alt key to select completion suggestion
inoremap <expr> <A-j> pumvisible() ? "\<C-n>" : "\<A-j>"
inoremap <expr> <A-k> pumvisible() ? "\<C-p>" : "\<A-k>"
" show doc string for jedi
let g:deoplete#sources#jedi#show_docstring = 1
"
" vim-autoformat --------------------------------------------------------------
" au InsertLeave,BufWrite * :Autoformat
" Ale -------------------------------------------------------------------------
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠︎'
" autopairs -------------------------------------------------------------------
let g:AutoPairsFlyMode = 0
" vim-test
" make test commands execute using dispatch.vim
if has('nvim')
  let test#strategy = "neovim"
endif
"
" python-syntax ---------------------------------------------------------------
let g:python_highlight_all = 1
"
" }}}
" *****************************************************************************
" {{{ Keymaps
" *****************************************************************************
" Saving and Quiting
noremap  <leader>w  :update<CR>
vnoremap <leader>w  <C-C>:update<CR>
inoremap <leader>w  <C-O>:update<CR>
" TODO: still buggy and not fully satiesfied check if better option is
"       available
nnoremap <leader>q  :bd<CR>
noremap  <leader>Q  :qa<CR>
" Tabs
nnoremap <leader>n  :bprevious<CR>
nnoremap <leader>m  :bnext<CR>
inoremap <leader>n  <Esc>:bprevious<CR>i
inoremap <leader>m  <Esc>:bnext<CR>i
" Window managment
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Searching
nnoremap <space>          /
nnoremap <leader><space> :nohlsearch<CR>
" FZF bindings
noremap  <C-F>  :Files<CR>
noremap  <C-G>  :GFiles<CR>
noremap  <C-T>  :Tags<CR>
noremap  <C-B>  :BTags<CR>
" unbind `Q` to enter in ex mode
map Q <Nop>
" }}}
" *****************************************************************************
" {{{ Custom Functions and helper
" *****************************************************************************
" Remove trailing spaces on save
au BufWritePre * :%s/\s\+$//e
" }}}
" *****************************************************************************
" {{{ Custom language settings
" *****************************************************************************
" OSIRIS  ---------------------------------------------------------------------
au BufNewFile,BufRead osiris_sys.*
      \ set syntax=make               " syntax for OSIRIS config files
" FORTRAN ---------------------------------------------------------------------
au FileType *.f03
      \ let fortran_free_source=1 |   " force free source
      \ let fortran_dialect = "f08"   " use modern fortran for Fortran 2003
      \ set expandtab                 " use spaces instead of tab
" Markdown --------------------------------------------------------------------
let g:vim_markdown_preview_browser='Google Chrome'  " previewer plugin
let g:vim_markdown_preview_github=1                 " default style for preview
let g:vim_markdown_folding_disabled = 1             " annoying folding of Md
let g:vim_markdown_conceal = 0                      " seems buggy with conceal
autocmd BufRead,BufNewFile *.md setlocal spell      " automatically spell check
" preview Markdown after saving it
au BufWritePost       *.md call Vim_Markdown_Preview()
" Vagrant ---------------------------------------------------------------------
au BufRead,BufNewFile Vagrantfile set filetype=ruby
" Git Commits -----------------------------------------------------------------
" Use spell checking for commits but don't check for capital letters
au FileType gitcommit
      \ setlocal spell |
      \ set spellcapcheck=
" Python  ---------------------------------------------------------------------
au BufRead,BufNewFile *.py
      \ set tabstop=4               " number of visual spaces per TAB
      \ set softtabstop=4           " number of spaces in tab when editing
      \ set expandtab               " use spaces for python
      \ set shiftwidth=4            " number of spaces to use for indent
      \ let python_highlight_all=1  " enable all python syntax features
" }}}
