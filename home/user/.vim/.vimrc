set nocompatible
set number
" turn off white flashes
set belloff=all
set mouse=
set ruler
syntax on
filetype plugin indent on
set noesckeys
set nobackup noswapfile
set scrolloff=10
autocmd FileType * setlocal expandtab softtabstop=2 tabstop=2 shiftwidth=2
autocmd FileType make setlocal noexpandtab
set smarttab
set incsearch hlsearch
set ignorecase smartcase
set modeline
set showcmd showmode showmatch
set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set encoding=utf-8
set autoindent autochdir
colorscheme default
set cinoptions=l1
set iminsert=0
set imsearch=0
set textwidth=72
" set colorcolumn=72
se fo-=t
" set statusline=...[%{&fo}]...
" packadd! termdebug
" packadd editorconfig
" nix store (very slow)
" set path+=/nix/store/**
set exrc
set secure
runtime! ftplugin/man.vim

