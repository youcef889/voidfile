
" Start vim-plug setup
call plug#begin('~/.vim/plugged')

" Add plugins here (example plugins below)
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'
call plug#end()


" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.


" Basic settings
syntax on                " Enable syntax highlighting
set number               " Show line numbers
set showcmd              " Show (partial) command in status line
set cursorline           " Highlight the current line
set wildmenu             " Visual autocomplete for command menu
set expandtab            " Use spaces instead of tabs
set tabstop=4            " Number of spaces tabs count for
set shiftwidth=4         " Number of spaces to use for each step of (auto)indent
set softtabstop=4        " Number of spaces that a <Tab> counts for while performing editing operations
set autoindent           " Copy indent from current line when starting a new line
set smartindent          " Automatically inserts indents in some cases
set number       " Show relative line numbers
set hlsearch             " Highlight search results
set incsearch            " Show search matches as you type
set ignorecase           " Ignore case when searching
set smartcase            " Override 'ignorecase' if search pattern contains upper case characters
set backspace=indent,eol,start  " Make backspace work as expected

" Appearance

" Status line
set laststatus=2         " Always display the status line
set ruler                " Show the cursor position all the time

" Clipboard
set clipboard=unnamedplus " Use system clipboard

" File handling
set autoread             " Automatically re-read files if changed outside of Vim
set hidden               " Allow switching buffers without saving

" Miscellaneous
set mouse=a              " Enable mouse usage
set clipboard+=unnamedplus " Use system clipboard for all operations
set wildmode=longest:list,full " Command-line completion mode

let mapleader = "/"



" Save the cursor position when closing a file and restore it when reopening
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif
endif

" Enable persistent undo
set undofile

" Confirm before closing Vim with unsaved changes
set confirm
 
" Example configuration
syntax on

colorscheme embark


"Search down into subfolders 
"Provides tab-completion for all file-related tasks
set path +=**
"Display all matching files when we tab complete
set wildmenu
"-Hit  tab to : find  by partil match
"-Use * to make if  fuzzy
"- :b lets you autocomplete any open buffer
   
command! MakeTags !ctags -R .
"New WE CAN 
" -use ^] to jump to tag under cursor
" -Use g^] for ambiguous tags
" -Use ^t to jump back up the tag stack
"  THINGS TO  CONSIDER
"  -THIS Doesn't help if you want a visual list of tags




