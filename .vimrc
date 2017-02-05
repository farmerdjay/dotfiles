
"General Setting

set nocompatible        " not compatible with the old-fashion vi mode
set bs=2                " allow backspacing over everything in insert mode
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set autoread            " auto read when file is changed from outside


filetype off          " necessary to make ftdetect work on Linux
syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc


set hlsearch            " search highlighting
set autoindent          " auto indentation
set incsearch           " incremental search
set nobackup            " no *~ backup files
set copyindent          " copy the previous indentation on autoindenting
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab            " insert tabs on the start of a line according to context
set number              " show line number
set cursorline          " highlight the current line
:hi cursorline cterm=none

" Airline Status Line {
	set laststatus=2
	let g:airline_powerline_fonts = 1
	let g:airline_theme='dark'
"}

""Status line from vgod {
"	set laststatus=2
"	set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
"	set statusline+=\ \ \ [%{&ff}/%Y] 
"	set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
"	set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
"	
"	function! CurDir()
"		let curdir = substitute(getcwd(), $HOME, "~", "")
"	        return curdir
"	endfunction
"	
"	function! HasPaste()
"		if &paste
"			return '[PASTE]'
"		else
"			return ''
"		endif
"	endfunction
""}

